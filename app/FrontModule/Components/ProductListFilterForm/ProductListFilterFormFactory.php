<?php

namespace App\FrontModule\Components\ProductListFilterForm;

/**
 * Interface ProductListFilterFormFactory
 * @package App\FrontModule\Components\ProductListFilterForm
 */
interface ProductListFilterFormFactory {
    public function create(): ProductListFilterForm;
}