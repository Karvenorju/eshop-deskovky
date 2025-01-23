<?php

namespace App\AdminModule\Components\UserEditForm;

use App\Model\Entities\User;
use App\Model\Facades\UsersFacade;
use Nette;
use Nette\Application\UI\Form;
use Nette\Forms\Controls\SubmitButton;
use Nette\SmartObject;
use Nextras\FormsRendering\Renderers\Bs4FormRenderer;
use Nextras\FormsRendering\Renderers\FormLayout;

/**
 * Class UserEditForm
 * @package App\AdminModule\Components\UserEditForm
 *
 * @method onFinished(string $message = '')
 * @method onFailed(string $message = '')
 * @method onCancel()
 */
class UserEditForm extends Form {

    use SmartObject;

    /** @var callable[] $onFinished */
    public array $onFinished = [];
    /** @var callable[] $onFailed */
    public array $onFailed = [];
    /** @var callable[] $onCancel */
    public array $onCancel = [];
    private User $userEntity;
    private UsersFacade $usersFacade;

    /**
     * UserEditForm constructor.
     * @param UsersFacade $usersFacade
     * @param Nette\ComponentModel\IContainer|null $parent
     * @param string|null $name
     */
    public function __construct(UsersFacade $usersFacade, Nette\ComponentModel\IContainer $parent = null, string $name = null) {
        parent::__construct($parent, $name);
        $this->setRenderer(new Bs4FormRenderer(FormLayout::VERTICAL));
        $this->usersFacade = $usersFacade;
        $this->usersFacade = $this->values['userEntity'];
        $this->createSubcomponents();
    }

    private function createSubcomponents(): void {
        $userId = $this->addHidden('userId');
        $this->addEmail('email', 'E-mail:')
            ->setDefaultValue($this->values['user']->getEmail())
            ->setRequired('Zadejte platný email')
            ->addRule(function (Nette\Forms\Controls\TextInput $input) {
                try {
                    $this->usersFacade->getUserByEmail($input->value);
                } catch (\Exception $e) {
                    return true;
                }
                return $this->userEntity->email == $input->value;
            }, 'Uživatel s tímto e-mailem je již registrován.');

        $this->addSubmit('ok', 'uložit')
            ->onClick[] = function (SubmitButton $button) {

        };
        $this->addSubmit('storno', 'zrušit')
            ->setValidationScope([$userId])
            ->onClick[] = function (SubmitButton $button) {
            $this->onCancel();
        };
    }

    /**
     * Metoda pro nastavení výchozích hodnot formuláře
     * @param User|array|object $values
     * @param bool $erase = false
     * @return $this
     */
    public function setDefaults($values, bool $erase = false): self {
        if ($values instanceof User) {
            $values = [
                'user' => $values
            ];
        }
        parent::setDefaults($values, $erase);
        return $this;
    }

}