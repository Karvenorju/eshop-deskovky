<?php

namespace App\FrontModule\Presenters;

class HomepagePresenter extends BasePresenter {

    public function renderDefault(): void {
        $topProducts = $this->productsFacade->findTopProducts();

        $this->template->topProducts = $topProducts;
    }

}
