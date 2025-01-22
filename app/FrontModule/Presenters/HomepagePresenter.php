<?php

namespace App\FrontModule\Presenters;

use App\Model\Facades\CategoriesFacade;

class HomepagePresenter extends BasePresenter {
    private CategoriesFacade $categoriesFacade;

    public function __construct(CategoriesFacade $categoriesFacade) {
        parent::__construct();
        $this->categoriesFacade = $categoriesFacade;
    }

    public function renderDefault(): void {
        $topProducts = $this->productsFacade->findTopProducts();
        $this->template->topProducts = $topProducts;

        $topCategories = $this->categoriesFacade->findTopCategories();
        $this->template->topCategories = $topCategories;
    }

}
