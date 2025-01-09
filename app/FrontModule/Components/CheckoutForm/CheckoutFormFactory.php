<?php

namespace App\FrontModule\Components\CheckoutForm;

/**
 * Interface CheckoutFormFactory
 * @package App\FrontModule\Components\CheckoutFormFactory
 */
interface CheckoutFormFactory {
    public function create(): CheckoutForm;

}