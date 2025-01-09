<?php

namespace App\FrontModule\Components\CheckoutForm;

use App\FrontModule\Components\UserLoginControl\UserLoginControl;
use App\Model\Entities\User;
use App\Model\Facades\UsersFacade;
use Nette;
use Nette\Application\UI\Form;
use Nette\SmartObject;
use Nextras\FormsRendering\Renderers\Bs4FormRenderer;
use Nextras\FormsRendering\Renderers\FormLayout;

class CheckoutForm extends Form
{
    use SmartObject;

    private UsersFacade $usersFacade;

    public function __construct(UserLoginControl $userLoginControl, UsersFacade $usersFacade, Nette\ComponentModel\IContainer $parent = null, string $name = null)
    {
        parent::__construct($parent, $name);
        $this->setRenderer(new Bs4FormRenderer(FormLayout::VERTICAL));
        $this->usersFacade = $usersFacade;
        $loggedUserId = $userLoginControl->getCurrentUser()->getId();
        $userEntity = Null;
        if ($loggedUserId) {
            $userEntity = $this->usersFacade->getUser($loggedUserId);
        }
        $this->createSubcomponents($userEntity);
    }

    private function createSubcomponents(?User $user): void
    {
        // User Information
        $this->addText('name', 'Jméno a příjmení:')
            ->setDefaultValue($user?->name)
            ->setRequired('Zadejte své jméno')
            ->setHtmlAttribute('maxlength', 100)
            ->addRule(Form::MAX_LENGTH, 'Jméno je příliš dlouhé, může mít maximálně 100 znaků.', 100);

        $this->addEmail('email', 'E-mail:')
            ->setDefaultValue($user?->email)
            ->setRequired('Zadejte platný e-mail');

        $this->addText('phone', 'Telefon:')
            ->setDefaultValue($user?->phone)
            ->setRequired('Zadejte telefonní číslo')
            ->setHtmlAttribute('maxlength', 15)
            ->addRule(Form::PATTERN, 'Zadejte platné telefonní číslo.', '^[0-9+\s-]+$');

        // Address Information
        $this->addText('city', 'Město:')
            ->setDefaultValue($user?->city)
            ->setRequired('Zadejte město');

        $this->addText('street', 'Ulice:')
            ->setDefaultValue($user?->street)
            ->setRequired('Zadejte ulici a číslo domu');

        $this->addText('postalCode', 'PSČ:')
            ->setDefaultValue($user?->postalCode)
            ->setRequired('Zadejte PSČ')
            ->addRule(Form::PATTERN, 'Zadejte platné PSČ.', '^\d{5}$');
        // Submit Button
        $this->addSubmit('submitOrder', 'Odeslat objednávku')
            ->setHtmlAttribute('class', 'btn btn-primary btn-block'); // Třída pro styl tlačítka
    }
}
