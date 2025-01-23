<?php

namespace App\AdminModule\Presenters;

use App\AdminModule\Components\UserEditForm\UserEditForm;
use App\Model\Facades\UsersFacade;

/**
 * Class UserPresenter
 * @package App\AdminModule\Presenters
 */
class UserPresenter extends BasePresenter {
    private UsersFacade $usersFacade;
    private ?int $editedUserId = null;

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
            $this->template->editedUserId = $id; // Pass user ID to the template
        } catch (\Exception $e) {
            $this->flashMessage('Požadovaný uživatel nebyl nalezen.', 'error');
            $this->redirect('default');
        }
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
        $form = new UserEditForm($this->usersFacade);

        // Read user ID from HTTP request (if set, otherwise from template)
        $userId = $this->getParameter('id') ?? $this->template->editedUserId ?? null;
        if ($userId === null) {
            throw new \Nette\Application\BadRequestException('Uživatelské ID není k dispozici.');
        }

        $userEntity = $this->usersFacade->getUser($userId);

        $form->setDefaults([
            'email' => $userEntity->getEmail(),
            'userId' => $userId,  // Store the ID in a hidden field
        ]);

        $form->onFinished[] = function ($message = null) {
            if (!empty($message)) {
                $this->flashMessage($message);
            }
            $this->redirect('default');
        };

        $form->onCancel[] = function () {
            $this->redirect('default');
        };

        return $form;
    }


    #region injections
    public function injectUsersFacade(UsersFacade $usersFacade): void {
        $this->usersFacade = $usersFacade;
    }

    #endregion injections

}
