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

    private User $user;

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
        $this->user = $userEntity;

        $this->createSubcomponents();
    }

    private function createSubcomponents(): void {
        $this->addText('name', 'Jméno a příjmení:')
            ->setDefaultValue($this->user->name)
            ->setRequired('Zadejte své jméno')
            ->setHtmlAttribute('maxlength', 40)
            ->addRule(Nette\Forms\Form::MAX_LENGTH, 'Jméno je příliš dlouhé, může mít maximálně 40 znaků.', 40);
        $this->addEmail('email', 'E-mail')
            ->setDefaultValue($this->user->email)
            ->setRequired('Zadejte platný email')
            ->addRule(function (Nette\Forms\Controls\TextInput $input) {
                try {
                    $this->usersFacade->getUserByEmail($input->value);
                } catch (\Exception $e) {
                    //pokud nebyl uživatel nalezen (tj. je vyhozena výjimka), je to z hlediska registrace v pořádku
                    return true;
                }
                return $this->user->email == $input->value;
            }, 'Uživatel s tímto e-mailem je již registrován.');
        $this->addText('phone', 'Tel. číslo:')
            ->setDefaultValue($this->user->phone)
            ->setHtmlType('tel')
            ->setEmptyValue('+420 ')
            ->addRule(function ($control) {
                return $this->validatePhoneNumber($control->getValue());
            }, 'Telefonní číslo není platné.')
            ->setHtmlAttribute('maxlength', 20);
        $this->addText('address', 'Doručovací adresa')
            ->setDefaultValue($this->user->address)
            ->setHtmlAttribute('maxlength', 200);

        $this->addSubmit('ok', 'Uložit změny')
            ->onClick[] = function (SubmitButton $button) {
            //uložení uživatele
            $values = $this->getValues('array');
            $this->user->name = $values['name'];
            $this->user->email = $values['email'];
            $this->user->phone = $values['phone'];
            $this->user->address = $values['address'];
            $this->usersFacade->saveUser($this->user);
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