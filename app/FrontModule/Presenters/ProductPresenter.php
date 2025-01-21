<?php

namespace App\FrontModule\Presenters;

use App\FrontModule\Components\CartControl\CartControl;
use App\FrontModule\Components\ProductCartForm\ProductCartForm;
use App\FrontModule\Components\ProductCartForm\ProductCartFormFactory;
use App\FrontModule\Components\ProductListFilterForm\ProductListFilterForm;
use App\FrontModule\Components\ProductListFilterForm\ProductListFilterFormFactory;
use Nette\Application\BadRequestException;
use Nette\Application\UI\Multiplier;

/**
 * Class ProductPresenter
 * @package App\FrontModule\Presenters
 * @property string $category
 */
class ProductPresenter extends BasePresenter {
    private ProductCartFormFactory $productCartFormFactory;
    private ProductListFilterFormFactory $productListFilterFormFactory;

    /** @persistent */
    public string $category;

    /**
     * Akce pro zobrazení jednoho produktu
     * @param string $url
     * @throws BadRequestException
     */
    public function renderShow(string $url): void {
        try {
            $product = $this->productsFacade->getProductByUrl($url);
        } catch (\Exception $e) {
            throw new BadRequestException('Produkt nebyl nalezen.');
        }
        $this->template->product = $product;
    }

    /**
     * Akce pro vykreslení přehledu produktů
     */
    public function renderList(): void {
        //TODO tady by mělo přibýt filtrování podle kategorie, stránkování atp.
        $filterParams = $this->getHttpRequest()->getPost();
        $search = $this->getHttpRequest()->getQuery('search');
        if (!empty($search)) {
            $filterParams['search'] = trim($search);
        }
        $this->template->products = $this->productsFacade->findProducts($filterParams);
    }

    protected function createComponentProductCartForm(): Multiplier {
        return new Multiplier(function ($productId) {
            $form = $this->productCartFormFactory->create();
            $form->setDefaults(['productId' => $productId]);
            $form->onSubmit[] = function (ProductCartForm $form) {
                try {
                    $product = $this->productsFacade->getProduct($form->values->productId);
                    //kontrola zakoupitelnosti
                } catch (\Exception $e) {
                    $this->flashMessage('Produkt nejde přidat do košíku', 'error');
                    if ($this->isAjax()) {
                        $this->redrawControl('flashes');
                    } else {
                        $this->redirect('this');
                    }
                }
                //přidání do košíku
                /** @var CartControl $cart */
                $cart = $this->getComponent('cart');
//                $cart->addToCart($product, (int)$form->values->count);
                $cart->addToCart($product, 1);

                $this->flashMessage('Produkt přidán do košíku: ' . $product->title);
                if ($this->isAjax()) {
                    $this->redrawControl('flashes');
                    $this->redrawControl('cart');
                } else {
                    $this->redirect('this');
                }
            };

            return $form;
        });
    }

    protected function createComponentProductListFilterForm(): ProductListFilterForm {
        $form = $this->productListFilterFormFactory->create();
        $form->onSubmit[] = function (ProductListFilterForm $form) {
            $this->redirect('this', $form->getValues(true));
        };

        return $form;
    }

    #region injections
    public function injectProductCartFormFactory(ProductCartFormFactory $productCartFormFactory): void {
        $this->productCartFormFactory = $productCartFormFactory;
    }

    public function injectProductListFilterFormFactory(ProductListFilterFormFactory $productListFilterFormFactory): void {
        $this->productListFilterFormFactory = $productListFilterFormFactory;
    }
    #endregion injections
}