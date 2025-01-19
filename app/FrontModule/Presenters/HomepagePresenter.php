<?php

namespace App\FrontModule\Presenters;

use App\Model\Facades\ProductsFacade;

class HomepagePresenter extends BasePresenter {

    private ProductsFacade $productsFacade;

    public function __construct(ProductsFacade $productsFacade) {
        parent::__construct();
        $this->productsFacade = $productsFacade;
    }

    public function renderDefault() {

        $this->productsFacade->findProductsCount();

        $cartControl = $this['cart']; // Přístup ke komponentě přes BasePresenter
        // Získat data košíku
        $cart = $cartControl->getCart();

        // Pass data to the template
        $this->template->cart = $cart;
    }

}
