<?php

namespace App\AdminModule\Presenters;

use App\AdminModule\Components\UserEditForm\UserEditForm;
use App\AdminModule\Components\UserEditForm\UserEditFormFactory;
use App\Model\Facades\UsersFacade;

/**
 * Class UserPresenter
 * @package App\AdminModule\Presenters
 */
class UserPresenter extends BasePresenter {
    private UsersFacade $usersFacade;
    private UserEditFormFactory $userEditFormFactory;

    /**
     * Akce pro vykreslení seznamu uživatelů
     */
    public function renderDefault(): void {
        $this->template->users = $this->usersFacade->getAllUsers();
    }

    /**
     * Akce pro úpravu jednoho uživatele
     * @param int $id
     * @throws \Nette\Application\AbortException
     */
    public function renderEdit(int $id): void {
        try {
            $user = $this->usersFacade->getUser($id);
        } catch (\Exception $e) {
            $this->flashMessage('Požadovaný uživatel nebyl nalezen.', 'error');
            $this->redirect('default');
        }
        $form = $this->getComponent('userEditForm');
        $form->setDefaults($user);
    }

    /**
     * Akce pro smazání uživatele
     * @param int $id
     * @throws \Nette\Application\AbortException
     */
    public function actionDelete(int $id): void {
        try {
            $user = $this->usersFacade->getUser($id);
        } catch (\Exception $e) {
            $this->flashMessage('Požadovaný uživatel nebyl nalezen.', 'error');
            $this->redirect('default');
        }

        if ($this->usersFacade->deleteUser($user)) {
            $this->flashMessage('Uživatel byl smazán.', 'info');
        } else {
            $this->flashMessage('Uživatele není možné smazat, protože již provedl nákup.', 'error');
        }

        $this->redirect('default');
    }

    /**
     * Formulář na editaci uživatelů
     * @return UserEditForm
     */
    public function createComponentUserEditForm(): UserEditForm {
        $userEntity = $this->usersFacade->getUser($this->user->userId);
        $form = $this->userEditFormFactory->create();
        $form->values = ['userEntity' => $userEntity];

        $form->onCancel[] = function () {
            $this->redirect('default');
        };
        $form->onFinished[] = function ($message = null) {
            if (!empty($message)) {
                $this->flashMessage($message);
            }
            $this->redirect('default');
        };
        $form->onFailed[] = function ($message = null) {
            if (!empty($message)) {
                $this->flashMessage($message, 'error');
            }
            $this->redirect('default');
        };
        return $form;
    }

    #region injections
    public function injectUsersFacade(UsersFacade $usersFacade): void {
        $this->usersFacade = $usersFacade;
    }

    public function injectUserEditFormFactory(UserEditFormFactory $userEditFormFactory): void {
        $this->userEditFormFactory = $userEditFormFactory;
    }
    #endregion injections

}
