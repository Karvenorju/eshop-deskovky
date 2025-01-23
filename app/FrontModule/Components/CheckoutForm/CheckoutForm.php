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

class CheckoutForm extends Form {
    use SmartObject;

    private UsersFacade $usersFacade;

    public function __construct(UserLoginControl $userLoginControl, UsersFacade $usersFacade, Nette\ComponentModel\IContainer $parent = null, string $name = null) {
        parent::__construct($parent, $name);
        $this->setRenderer(new Bs4FormRenderer(FormLayout::VERTICAL));
        $this->usersFacade = $usersFacade;
        $user = $userLoginControl->getLoggedInUser();
        try {
            if (!empty($user)){
                $userEntity = $this->usersFacade->getUser($user->getId());

            } else {
                $userEntity = null;

            }
        } catch (\Exception $e) {
        }
        $this->createSubcomponents($userEntity);
    }

    private function createSubcomponents(?User $user): void {
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

        $this->addText('address', 'Adresa:')
            ->setDefaultValue($user?->address)
            ->setRequired('Zadejte ulici a číslo domu');

        $this->addRadioList('paymentMethod', 'Způsob platby', [
            'credit' => 'Kreditní karta',
            'debit' => 'Dobírka',
            'paypal' => 'PayPal',
        ])
            ->setDefaultValue('credit')
            ->setRequired();

        // Submit Button
        $this->addSubmit('submit', 'Odeslat objednávku')
            ->setHtmlAttribute('class', 'btn btn-primary btn-block'); // Třída pro styl tlačítka
    }
}
