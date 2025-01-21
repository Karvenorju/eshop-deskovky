<?php

namespace App\FrontModule\Presenters;

use App\FrontModule\Components\CartControl\CartControl;
use App\FrontModule\Components\CartControl\CartControlFactory;
use App\FrontModule\Components\UserLoginControl\UserLoginControl;
use App\FrontModule\Components\UserLoginControl\UserLoginControlFactory;
use App\Model\Facades\ProductsFacade;
use Nette\Application\AbortException;
use Nette\Application\ForbiddenRequestException;
use Nette\Forms\Form;

/**
 * Class BasePresenter
 * @package App\FrontModule\Presenters
 */
abstract class BasePresenter extends \Nette\Application\UI\Presenter {
    private UserLoginControlFactory $userLoginControlFactory;
    private CartControlFactory $cartControlFactory;
    protected ProductsFacade $productsFacade;

    /**
     * @throws ForbiddenRequestException
     * @throws AbortException
     */
    protected function startup(): void {
        parent::startup();
        Form::initialize();
        $presenterName = $this->request->presenterName;
        $action = !empty($this->request->parameters['action']) ? $this->request->parameters['action'] : '';

        $isAdmin = in_array('admin', $this->user?->roles ?? []);
        $this->template->isAdmin = $isAdmin;

        $allProducts = $this->productsFacade->getAllProducts();
        $productNames = array_map(function ($product) {
            return $product->title;
        }, $allProducts);

        $this->template->productNames = $productNames;

        if (!$this->user->isAllowed($presenterName, $action)) {
            if ($this->user->isLoggedIn()) {
                throw new ForbiddenRequestException();
            } else {
                $this->flashMessage('Pro zobrazení požadovaného obsahu se musíte přihlásit!', 'warning');
                //uložíme původní požadavek - předáme ho do persistentní proměnné v UserPresenteru
                $this->redirect('User:login', ['backlink' => $this->storeRequest()]);
            }
        }
    }

    /**
     * Komponenta pro zobrazení údajů o aktuálním uživateli (přihlášeném či nepřihlášeném)
     * @return UserLoginControl
     */
    public function createComponentUserLogin(): UserLoginControl {
        return $this->userLoginControlFactory->create();
    }

    /**
     * Komponenta košíku
     * @return CartControl
     */
    public function createComponentCart(): CartControl {
        return $this->cartControlFactory->create();
    }

    #region injections
    public function injectUserLoginControlFactory(UserLoginControlFactory $userLoginControlFactory): void {
        $this->userLoginControlFactory = $userLoginControlFactory;
    }

    public function injectCartControlFactory(CartControlFactory $cartControlFactory): void {
        $this->cartControlFactory = $cartControlFactory;
    }

    public function injectProductsFacade(ProductsFacade $productsFacade): void {
        $this->productsFacade = $productsFacade;
    }
    #endregion injections
}