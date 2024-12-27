<?php

namespace App\FrontModule\Components\UserProfileForm;

/**
 * Interface UserProfileFormFactory
 * @package App\FrontModule\Components\UserProfileFormFactory
 */
interface UserProfileFormFactory {

    public function create(): UserProfileForm;

}