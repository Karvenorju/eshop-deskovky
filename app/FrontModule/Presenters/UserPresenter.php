<?php

namespace App\FrontModule\Presenters;

use App\FrontModule\Components\ForgottenPasswordForm\ForgottenPasswordForm;
use App\FrontModule\Components\ForgottenPasswordForm\ForgottenPasswordFormFactory;
use App\FrontModule\Components\NewPasswordForm\NewPasswordForm;
use App\FrontModule\Components\NewPasswordForm\NewPasswordFormFactory;
use App\FrontModule\Components\UserLoginForm\UserLoginForm;
use App\FrontModule\Components\UserLoginForm\UserLoginFormFactory;
use App\FrontModule\Components\UserProfileForm\UserProfileForm;
use App\FrontModule\Components\UserProfileForm\UserProfileFormFactory;
use App\FrontModule\Components\UserRegistrationForm\UserRegistrationForm;
use App\FrontModule\Components\UserRegistrationForm\UserRegistrationFormFactory;
use App\Model\Api\Facebook\FacebookApi;
use App\Model\Facades\SaleOrderFacade;
use App\Model\Facades\UsersFacade;
use Nette;
use Nette\Application\BadRequestException;
use Nette\Utils\Paginator;

/**
 * Class UserPresenter - presenter pro akce týkající se uživatelů
 * @package App\FrontModule\Presenters
 * @property string $backlink
 */
class UserPresenter extends BasePresenter {

    /** @persistent */
    public string $backlink = '';

    private UsersFacade $usersFacade;
    private UserLoginFormFactory $userLoginFormFactory;
    private UserRegistrationFormFactory $userRegistrationFormFactory;
    private ForgottenPasswordFormFactory $forgottenPasswordFormFactory;
    private NewPasswordFormFactory $newPasswordFormFactory;
    private UserProfileFormFactory $userProfileFormFactory;
    private FacebookApi $facebookApi;
    private SaleOrderFacade $orderFacade;

    /**
     * Akce pro odhlášení uživatele
     * @throws Nette\Application\AbortException
     */
    public function actionLogout(): void {
        if ($this->user->isLoggedIn()) {
            $this->user->logout();
        }
        $this->redirect('Homepage:default');
    }

    /**
     * Akce pro přihlášení - pokud už je uživatel přihlášen, tak ho jen přesměrujeme na homepage
     * @throws Nette\Application\AbortException
     */
    public function actionLogin(): void {
        if ($this->user->isLoggedIn()) {
            //obnovíme uložený požadavek - pokud se to nepovede, pokračujeme přesměrováním
            $this->restoreRequest($this->backlink);
            $this->redirect('Homepage:default');
        }
    }

    /**
     * Akce pro registraci - pokud už je uživatel přihlášen, tak ho jen přesměrujeme na homepage
     * @throws Nette\Application\AbortException
     */
    public function actionRegister(): void {
        if ($this->user->isLoggedIn()) {
            $this->redirect('Homepage:default');
        }
    }

    public function renderSaleOrders(int $page = 1): void
    {
        $userId = $this->user->getId(); // Get logged-in user ID

        // Define number of orders per page
        $itemsPerPage = 10;
        // Get total count of user's orders for pagination
        $where = ['user_id' => $userId];
        $totalOrders = $this->orderFacade->countFilteredOrders($where);

        // Initialize paginator
        $paginator = new Paginator();
        $paginator->setItemCount($totalOrders);
        $paginator->setItemsPerPage($itemsPerPage);
        $paginator->setPage($page);

        // Fetch paginated orders
        $where = ['user_id' => $userId, 'order' => 'created_at DESC'];
        $userOrders = $this->orderFacade->findOrders(
            $where,
            $paginator->getOffset(),
            $paginator->getLength()
        );

        // Pass data to template
        $this->template->userOrders = $userOrders;
        $this->template->paginator = $paginator;
    }

    public function renderSaleOrder(int $id): void
    {
        $order = $this->orderFacade->getOrderById($id);

        if (!$order) {
            $this->flashMessage('Objednávka nebyla nalezena.', 'error');
            $this->redirect('saleOrders');
        }

        $this->template->order = $order;
    }

    /**
     * Akce pro přihlášení pomocí Facebooku
     * @param bool $callback
     * @throws Nette\Application\AbortException
     * @throws Nette\Application\UI\InvalidLinkException
     * @throws \InvalidArgumentException
     */
    public function actionFacebookLogin(bool $callback = false): void {
        //nastavíme URL pro zpětné přesměrování z Facebooku
        $this->facebookApi->redirectUri = $this->link('//User:facebookLogin', ['callback' => true]);

        //vyhodnotíme, zda jde o návrat z FB, nebo teprve o přesměrování na přihlášení
        if ($callback) {
            #region návrat z Facebooku
            try {
                $facebookUser = $this->facebookApi->getFacebookUser($this->getHttpRequest()->getQuery('code'), $this->getHttpRequest()->getQuery('state')); //v proměnné $facebookUser máme facebookId, email a jméno uživatele => jdeme jej přihlásit

                //necháme si vytvořit identitu uživatele
                $userUdentity = $this->usersFacade->getFacebookUserIdentity($facebookUser);

                //přihlásíme uživatele
                $this->user->login($userUdentity);

            } catch (\Exception $e) {
                $this->flashMessage('Přihlášení pomocí Facebooku se nezdařilo.', 'error');
                $this->redirect('Homepage:default');
            }

            //pokračujeme přesměrováním
            $this->redirect('Homepage:default');
            #endregion návrat z Facebooku
        } else {
            #region přesměrování na přihlášení pomocí Facebooku
            $facebookLoginLink = $this->facebookApi->getLoginUrl();
            $this->redirectUrl($facebookLoginLink);
            #endregion přesměrování na přihlášení pomocí Facebooku
        }
    }

    /**
     * Akce pro zadání nového hesla v rámci jeho obnovy
     * @param int $user
     * @param string $code
     * @throws BadRequestException
     * @throws Nette\Application\AbortException
     */
    public function renderRenewPassword(int $user, string $code): void {
        if ($this->usersFacade->isValidForgottenPasswordCode($user, $code)) {
            #region odkaz na obnovu hesla byl platný
            try {
                $userEntity = $this->usersFacade->getUser($user);
            } catch (\Exception $e) {
                throw new BadRequestException('Požadovaný uživatel neexistuje.', 'error');
            }

            $form = $this->getComponent('newPasswordForm');
            $form->setDefaults($userEntity);
            #endregion odkaz na obnovu hesla byl platný
        } else {
            #region odkaz již není platný
            $this->flashMessage('Odkaz na změnu hesla již není platný. Pokud potřebujete heslo obnovit, zašlete žádost znovu.', 'error');
            $this->redirect('Homepage:default');
            #endregion odkaz již není platný
        }
    }

    /**
     * Formulář pro přihlášení existujícího uživatele
     * @return UserLoginForm
     */
    protected function createComponentUserLoginForm(): UserLoginForm {
        $form = $this->userLoginFormFactory->create();
        $form->onFinished[] = function () use ($form) {
            $values = $form->getValues('array');
            try {
                $this->user->login($values['email'], $values['password']);
                //po přihlášení uživatele smažeme jeho kódy na obnovu hesla
                $this->usersFacade->deleteForgottenPasswordsByUser($this->user->id);
            } catch (\Exception $e) {
                $this->flashMessage('Neplatná kombinace e-mailu a hesla!', 'error');
                $this->redirect('login');
            }

            //obnovíme uložený požadavek - pokud se to nepovede, pokračujeme přesměrováním
            $this->restoreRequest($this->backlink);
            $this->redirect('Homepage:default');
        };
        $form->onCancel[] = function () use ($form) {
            $this->redirect('Homepage:default');
        };
        return $form;
    }

    /**
     * Formulář pro registraci nového uživatele
     * @return UserRegistrationForm
     */
    protected function createComponentUserRegistrationForm(): UserRegistrationForm {
        $form = $this->userRegistrationFormFactory->create();
        $form->onFinished[] = function () use ($form) {
            $values = $form->getValues('array');
            try {
                //po registraci uživatele rovnou i přihlásíme
                $this->user->login($values['email'], $values['password']);
                $this->flashMessage('Vítejte v našem eshopu :)');
            } catch (\Exception $e) {
                $this->flashMessage('Při registraci se vyskytla chyba', 'error');
            }
            $this->redirect('Homepage:default');
        };
        $form->onCancel[] = function () use ($form) {
            $this->redirect('Homepage:default');
        };
        return $form;
    }

    /**
     * Formulář pro obnovu zapomenutého hesla
     * @return ForgottenPasswordForm
     */
    protected function createComponentForgottenPasswordForm(): ForgottenPasswordForm {
        $form = $this->forgottenPasswordFormFactory->create();
        $form->onFinished[] = function ($message = '') {
            if (!empty($message)) {
                $this->flashMessage($message);
            }
            $this->redirect('login');
        };
        $form->onCancel[] = function () use ($form) {
            $this->redirect('login');
        };
        return $form;
    }

    /**
     * Formulář pro zadání nového hesla
     * @return NewPasswordForm
     */
    protected function createComponentNewPasswordForm(): NewPasswordForm {
        $form = $this->newPasswordFormFactory->create();
        $form->onFinished[] = function ($message = '') {
            if (!empty($message)) {
                $this->flashMessage($message);
            }
            $this->user->logout();
            $this->redirect('login');
        };
        $form->onFailed[] = function ($message = '') {
            if (!empty($message)) {
                $this->flashMessage($message);
            }
            $this->redirect('Homepage:default');
        };
        $form->onCancel[] = function () use ($form) {
            $this->redirect('Homepage:default');
        };
        return $form;
    }

    /**
     * Formulář pro editaci uživatelského profilu
     * @return UserProfileForm
     */
    protected function createComponentUserProfileForm(): UserProfileForm {
        $form = $this->userProfileFormFactory->create();
        $form->onFinished[] = function () use ($form) {
            $values = $form->getValues('array');

            $userEntity = $this->usersFacade->getUser($this->user->id);
            //necháme si vytvořit identitu uživatele
            $userUdentity = $this->usersFacade->getUserIdentity($userEntity);

            //po změně uživ. údajů uživatele znovu přihlásíme
            $this->user->login($userUdentity);

            $this->flashMessage('Změny uloženy.');
        };
        $form->onCancel[] = function () use ($form) {
            $this->redirect('Homepage:default');
        };
        return $form;
    }

    #region injections
    public function injectUsersFacade(UsersFacade $usersFacade): void {
        $this->usersFacade = $usersFacade;
    }

    public function injectSaleOrdersFacade(SaleOrderFacade $saleOrdersFacade): void {
        $this->orderFacade = $saleOrdersFacade;
    }

    public function injectUserLoginFormFactory(UserLoginFormFactory $userLoginFormFactory): void {
        $this->userLoginFormFactory = $userLoginFormFactory;
    }

    public function injectUserRegistrationFormFactory(UserRegistrationFormFactory $userRegistrationFormFactory): void {
        $this->userRegistrationFormFactory = $userRegistrationFormFactory;
    }

    public function injectForgottenPasswordFormFactory(ForgottenPasswordFormFactory $forgottenPasswordFormFactory): void {
        $this->forgottenPasswordFormFactory = $forgottenPasswordFormFactory;
    }

    public function injectNewPasswordFormFactory(NewPasswordFormFactory $newPasswordFormFactory): void {
        $this->newPasswordFormFactory = $newPasswordFormFactory;
    }

    public function injectFacebookApi(FacebookApi $facebookApi): void {
        $this->facebookApi = $facebookApi;
    }

    public function injectUserProfilFormFactory(UserProfileFormFactory $userProfilFormFactory): void {
        $this->userProfileFormFactory = $userProfilFormFactory;
    }
    #endregion injections
}
