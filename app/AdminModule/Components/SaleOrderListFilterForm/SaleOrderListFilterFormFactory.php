<?php

namespace App\AdminModule\Components\SaleOrderListFilterForm;

use App\AdminModule\Components\ProductEditForm\ProductEditForm;

/**
 * Interface SaleOrderListFilterFormFactory
 * @package App\AdminModule\Components\SaleOrderListFilterForm
 */
interface SaleOrderListFilterFormFactory{

  public function create():SaleOrderListFilterForm;

}