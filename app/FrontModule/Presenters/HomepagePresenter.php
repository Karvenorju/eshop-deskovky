<?php

namespace App\FrontModule\Presenters;

use App\Model\Facades\ProductsFacade;

class HomepagePresenter extends BasePresenter {

    private ProductsFacade $productsFacade;

    public function __construct(ProductsFacade $productsFacade) {
        parent::__construct();
        $this->productsFacade = $productsFacade;
    }

    public function renderDefault(): void {
        $topProducts = $this->productsFacade->findTopProducts();

        $this->template->topProducts = $topProducts;
    }

}
