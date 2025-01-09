<?php

namespace App\FrontModule\Presenters;

use App\FrontModule\Components\CheckoutForm\CheckoutForm;
use App\FrontModule\Components\CheckoutForm\CheckoutFormFactory;
use \Nette\Application\UI\Form;
class CheckoutPresenter extends BasePresenter {

    private CheckoutFormFactory $checkoutFormFactory;

    public function injectCheckoutFormFactory(CheckoutFormFactory $factory): void
    {
        $this->checkoutFormFactory = $factory;
    }

    protected function createComponentCheckoutForm(): Form
    {
        $form = $this->checkoutFormFactory->create(); // Vytvoření formuláře pomocí factory
        $form->onSuccess[] = [$this, 'processCheckoutForm']; // Připojení callbacku
        return $form; // Vrácení formuláře
    }

    public function renderDefault(): void {
        // Připravíme data pro šablonu
        $cartControl = $this['cart'];
        $cart = $cartControl->getCart();
        $this->template->cart = $cart;

        // Přesměrování, pokud je košík prázdný
        if (empty($cart->items)) {
            $this->flashMessage('Košík je prázdný. Přidejte produkty před pokračováním.', 'warning');
            $this->redirect('Homepage:default');
        }
    }

    public function processCheckoutForm(Form $form, array $values): void
    {
        // Zpracování dat z formuláře
        bdump($values); // Bez ovlivnění HTTP hlaviček

        // Logika pro uložení objednávky nebo další kroky
        // Např. vytvoření objednávky v databázi, odeslání e-mailu apod.

        // Zobrazení zprávy a přesměrování
        $this->flashMessage('Objednávka byla úspěšně odeslána.', 'success');
        $this->redirect('Homepage:default');
    }
}

