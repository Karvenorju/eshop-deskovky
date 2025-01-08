<?php

namespace App\FrontModule\Presenters;

class CartPresenter extends BasePresenter {
    public function renderDefault(): void {
        $cartControl = $this['cart']; // Přístup ke komponentě přes BasePresenter
        // Získat data košíku
        $cart = $cartControl->getCart();

        // Pass data to the template
        $this->template->cart = $cart;
    }

}
