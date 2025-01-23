<?php

namespace App\FrontModule\Presenters;

use App\FrontModule\Components\CartControl\CartControl;
use App\FrontModule\Components\ProductCartForm\ProductCartForm;
use App\FrontModule\Components\ProductCartForm\ProductCartFormFactory;
use App\FrontModule\Components\ProductListFilterForm\ProductListFilterForm;
use App\FrontModule\Components\ProductListFilterForm\ProductListFilterFormFactory;
use Nette\Application\BadRequestException;
use Nette\Application\UI\Multiplier;
use App\Model\Api\Bgg\BggApi;
use Nette\Utils\Paginator;


/**
 * Class ProductPresenter
 * @package App\FrontModule\Presenters
 * @property string $category
 */
class ProductPresenter extends BasePresenter {
    private ProductCartFormFactory $productCartFormFactory;
    private ProductListFilterFormFactory $productListFilterFormFactory;
    private BggApi $bggApi;

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
        $rating= $this->bggApi->getRating($product->bggId);
        if ($product->bggId) {
            try {
                $rating= $this->bggApi->getRating($product->bggId);
                $this->template->rating = round($rating);
            } catch (\Exception $e) {
                $this->flashMessage('Nepodařilo se načíst hodnocení z BGG', 'warning');
            }
        }
        $this->template->product = $product;
    }

    /**
     * Akce pro vykreslení přehledu produktů
     */
    public function renderList(int $page = 1): void {
        //TODO tady by mělo přibýt filtrování podle kategorie, stránkování atp.
        $filterParams = $this->getHttpRequest()->getPost();
        $search = $this->getHttpRequest()->getQuery('search');
        if (!empty($search)) {
            $filterParams['search'] = trim($search);
        }

        $itemsPerPage = 10; // Define how many orders per page
        $products = $this->productsFacade->findProducts($filterParams); // Get total count based on filter
        // Initialize paginator
        $paginator = new Paginator();
        $paginator->setItemCount(sizeof($products));
        $paginator->setItemsPerPage($itemsPerPage);
        $paginator->setPage($page);

        $products = $this->productsFacade->findProducts(
            $filterParams,
            $paginator->getOffset(),
            $paginator->getLength()
        );
        $this->template->products = $products;
//        $this->template->filterParams = $filterParams;
        $this->template->paginator = $paginator;

//        $this->template->products = $this->productsFacade->findProducts($filterParams);
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
                $cart->addToCart($product, (int)$form->values->count);

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
    public function injectBggApi(BggApi $bggApi): void {
        $this->bggApi = $bggApi;
    }
    #endregion injections
}