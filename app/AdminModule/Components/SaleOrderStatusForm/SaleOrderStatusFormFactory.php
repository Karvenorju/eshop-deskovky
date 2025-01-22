<?php

namespace App\AdminModule\Components\SaleOrderStatusForm;

use App\AdminModule\Components\ProductEditForm\ProductEditForm;
use App\AdminModule\Components\SaleOrderListFilterForm\SaleOrderListFilterForm;
use App\Model\Entities\SaleOrder;

/**
 * Interface SaleOrderStatusFormFactory
 * @package App\AdminModule\Components\SaleOrderListFilterForm
 */
interface SaleOrderStatusFormFactory{
    public function create(SaleOrder $order): SaleOrderStatusForm;
}