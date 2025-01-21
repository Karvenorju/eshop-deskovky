<?php

namespace App\FrontModule\Components\UserProfileForm;

use App\FrontModule\Components\UserLoginControl\UserLoginControl;
use App\Model\Entities\User;
use App\Model\Facades\UsersFacade;
use Brick\PhoneNumber\PhoneNumber;
use Brick\PhoneNumber\PhoneNumberParseException;
use Nette;
use Nette\Application\UI\Form;
use Nette\ComponentModel\IContainer;
use Nette\Forms\Controls\SubmitButton;
use Nette\SmartObject;
use Nextras\FormsRendering\Renderers\Bs4FormRenderer;
use Nextras\FormsRendering\Renderers\FormLayout;

/**
 * Class UserProfileForm
 * @package App\FrontModule\Components\UserProfileForm
 *
 * @method onFinished()
 * @method onCancel()
 */
class UserProfileForm extends Form {

    use SmartObject;

    /** @var callable[] $onFinished */
    public array $onFinished = [];
    /** @var callable[] $onCancel */
    public array $onCancel = [];

    private UsersFacade $usersFacade;

    private User $userEntity;

    /**
     * UserRegistrationForm constructor.
     * @param UsersFacade $usersFacade
     * @param IContainer|null $parent
     * @param string|null $name
     */
    public function __construct(UserLoginControl $userLoginControl, UsersFacade $usersFacade, Nette\ComponentModel\IContainer $parent = null, string $name = null) {
        parent::__construct($parent, $name);
        $this->setRenderer(new Bs4FormRenderer(FormLayout::VERTICAL));
        $this->usersFacade = $usersFacade;

        $userEntity = $this->usersFacade->getUser($userLoginControl->getCurrentUser()->getId());
        $this->userEntity = $userEntity;

        $this->createSubcomponents();
    }

    private function createSubcomponents(): void {
        $this->addText('name', 'Jméno a příjmení:')
            ->setDefaultValue($this->userEntity->name)
            ->setRequired('Zadejte své jméno')
            ->setHtmlAttribute('maxlength', 40)
            ->addRule(Nette\Forms\Form::MAX_LENGTH, 'Jméno je příliš dlouhé, může mít maximálně 40 znaků.', 40);
        $this->addEmail('email', 'E-mail:')
            ->setDefaultValue($this->userEntity->email)
            ->setRequired('Zadejte platný email')
            ->addRule(function (Nette\Forms\Controls\TextInput $input) {
                try {
                    $this->usersFacade->getUserByEmail($input->value);
                } catch (\Exception $e) {
                    return true;
                }
                return $this->userEntity->email == $input->value;
            }, 'Uživatel s tímto e-mailem je již registrován.');
        $this->addText('phone', 'Telefonní číslo:')
            ->setDefaultValue($this->userEntity->phone)
            ->setHtmlType('tel')
            ->setEmptyValue('+420 ')
            ->addRule(function ($control) {
                return $this->validatePhoneNumber($control->getValue());
            }, 'Telefonní číslo není platné.')
            ->setHtmlAttribute('maxlength', 20);
        $this->addText('address', 'Doručovací adresa:')
            ->setDefaultValue($this->userEntity->address)
            ->setHtmlAttribute('maxlength', 200);

        $this->addSubmit('ok', 'Uložit změny')
            ->onClick[] = function (SubmitButton $button) {
            //uložení uživatele
            $values = $this->getValues('array');
            $this->userEntity->name = $values['name'];
            $this->userEntity->email = $values['email'];
            $this->userEntity->phone = $values['phone'];
            $this->userEntity->address = $values['address'];
            $this->usersFacade->saveUser($this->userEntity);

            $this->onFinished();
        };
    }

    function validatePhoneNumber(string $number): bool {
        try {
            $number = PhoneNumber::parse($number);
        } catch (PhoneNumberParseException $e) {
            return false;
        }
        return $number->isValidNumber();
    }

}