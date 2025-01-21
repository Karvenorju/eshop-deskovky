<?php

namespace App\FrontModule\Presenters;


use App\FrontModule\Components\CheckoutForm\CheckoutFormFactory;
use App\Model\Entities\Cart;
use App\Model\Facades\SaleOrderFacade;
use App\Model\Facades\UsersFacade;
use Nette\Application\UI\Form;

class CheckoutPresenter extends BasePresenter
{
    private CheckoutFormFactory $checkoutFormFactory;
    private SaleOrderFacade $saleOrderFacade;
    private UsersFacade $usersFacade;

    public function renderDefault(): void
    {
        // Připravíme data pro šablonu
        $cart = $this['cart']->getCart();
        $this->template->cart = $cart;

        // Přesměrování, pokud je košík prázdný
        $this->checkCartIsNotEmpty($cart);
    }

    protected function createComponentCheckoutForm(): Form {
        $form = $this->checkoutFormFactory->create();
        $form->onSuccess[] = [$this, 'processCheckoutForm'];
        return $form;
    }

    public function processCheckoutForm(Form $form, array $values): void
    {
        try {
            // Check cart emptiness
            // Fetch the cart
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

    public function injectSaleOrderFacade(SaleOrderFacade $saleOrderFacade): void
    {
        $this->saleOrderFacade = $saleOrderFacade;
    }

    public function injectUsersFacade(UsersFacade $usersFacade): void
    {
        $this->usersFacade = $usersFacade;
    }

    public function injectCheckoutFormFactory(CheckoutFormFactory $factory): void {
        $this->checkoutFormFactory = $factory;
    }

}

