<?php

namespace App\FrontModule\Presenters;

use App\FrontModule\Components\CartControl\CartControl;
use App\FrontModule\Components\CheckoutForm\CheckoutFormFactory;
use App\FrontModule\Components\UserLoginControl\UserLoginControl;
use App\Model\Entities\Cart;
use App\Model\Facades\ProductsFacade;
use App\Model\Facades\SaleOrderFacade;
use App\Model\Facades\UsersFacade;
use Nette\Application\UI\Form;

class CheckoutPresenter extends BasePresenter
{

    private SaleOrderFacade $saleOrderFacade;
    private ProductsFacade $productsFacade;
    private UsersFacade $usersFacade;


    public function injectSaleOrderFacade(SaleOrderFacade $saleOrderFacade): void
    {
        $this->saleOrderFacade = $saleOrderFacade;
    }

    public function injectUsersFacade(UsersFacade $usersFacade): void
    {
        $this->usersFacade = $usersFacade;
    }

    public function injectProductFacade(ProductsFacade $productsFacade): void
    {
        $this->productsFacade = $productsFacade;
    }

    protected function createComponentCheckoutForm(): Form
    {
        $loggedUserId = $this['userLogin']->getCurrentUser()->getId();
        $user = Null;
        if ($loggedUserId) {
            $user = $this->usersFacade->getUser($loggedUserId);
        }

        $form = new Form;
        $form->addText('name', 'Jméno')
            ->setRequired()->setDefaultValue($user?->name)
            ->setHtmlAttribute('maxlength', 100)
            ->addRule(Form::MAX_LENGTH, 'Jméno je příliš dlouhé, může mít maximálně 100 znaků.', 100);
        $form->addEmail('email', 'E-mail')->setRequired()->setDefaultValue($user?->email);
        $form->addText('address', 'Adresa')->setRequired()->setDefaultValue($user?->address);
        $form->addText('phone', 'Telefon')
            ->setRequired()
            ->setDefaultValue($user?->phone)
            ->setHtmlAttribute('maxlength', 15)
            ->addRule(Form::PATTERN, 'Zadejte platné telefonní číslo.', '^[0-9+\s-]+$');;
        $form->addRadioList('paymentMethod', 'Způsob platby', [
            'credit' => 'Kreditní karta',
            'debit' => 'Dobírka',
            'paypal' => 'PayPal',
        ])->setRequired();

        $form->addSubmit('submit', 'Dokončit objednávku');
        $form->onSuccess[] = [$this, 'processCheckoutForm'];

        return $form;
    }


    public function renderDefault(): void
    {
        // Připravíme data pro šablonu
        $cart = $this['cart']->getCart();
        $this->template->cart = $cart;

        // Přesměrování, pokud je košík prázdný
        $this->checkCartIsNotEmpty($cart);
    }

    public function processCheckoutForm(Form $form, array $values): void
    {
        try {
            // Check cart emptiness
            // Fetch the cart
            /** @var CartControl $cartControl */
            $cartControl = $this['cart'];
            $cart = $cartControl->getCart();
            $this->checkCartIsNotEmpty($cart);

            $userLoginControl = $this['userLogin'];
            $userEntity = $this->usersFacade->getUser($userLoginControl->getCurrentUser()->getId());

            // Order data from form
            $orderData = [
                'user' => $userEntity,
                'customerName' => $values['name'],
                'customerEmail' => $values['email'],
                'customerPhone' => $values['phone'],
                'customerAddress' => $values['address'],
            ];
            // Call SaleOrderFacade to create order
            $this->saleOrderFacade->createOrder($orderData, $cart->cartId);

            foreach ($cart->items as $cartItem) {
                $orderedProductEntity = $this->productsFacade->getProduct($cartItem->product->productId);
                $orderedQuantity = $cartItem->count;

                $orderedProductEntity->soldQuantity = $orderedProductEntity->soldQuantity + $orderedQuantity;
                $this->productsFacade->saveProduct($orderedProductEntity);
            }

            // Show success message and redirect
            $this->flashMessage('Objednávka byla úspěšně vytvořena.', 'success');

        } catch (\Exception $e) {
            $this->flashMessage('Chyba při vytváření objednávky: ' . $e->getMessage(), 'danger');
        }
        $this->redirect('Homepage:default');
    }

    private function checkCartIsNotEmpty(Cart $cart): void
    {
        // Přesměrování, pokud je košík prázdný
        if (empty($cart->items)) {
            $this->flashMessage('Košík je prázdný. Přidejte produkty před pokračováním.', 'warning');
            $this->redirect('Homepage:default');
        }
    }

}

