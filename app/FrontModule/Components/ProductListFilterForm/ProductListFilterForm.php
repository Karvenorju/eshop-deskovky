<?php

namespace App\FrontModule\Components\ProductListFilterForm;

use App\Model\Facades\ProductsFacade;
use Nette\Forms\Form;
use Nette\SmartObject;
use Nextras\FormsRendering\Renderers\Bs4FormRenderer;
use Nextras\FormsRendering\Renderers\FormLayout;
use Nette;

class ProductListFilterForm extends Form {
    use SmartObject;

    private ProductsFacade $productsFacade;

    /**
     * @param Nette\ComponentModel\IContainer|null $parent
     * @param string|null $name
     * @param ProductsFacade $productsFacade
     */
    public function __construct(ProductsFacade $productsFacade, Nette\ComponentModel\IContainer $parent = null, string $name = null){
        parent::__construct($parent, $name);
        $this->productsFacade = $productsFacade;
        $this->setRenderer(new Bs4FormRenderer(FormLayout::VERTICAL));
        $this->createSubcomponents();
    }

    private function createSubcomponents(){
        /*
         * TODO fitering by: category (checkboxes), price (double range slider), number of players (double range slider), age (radio buttons), play time (range slider), search (text input)
         */
        $filterParams = $this->productsFacade->getFilterParams();

        // Category (checkboxes)
        $this->addCheckboxList('category', 'Category', $filterParams['categories']);

        // Price (slider)
        $this->addInteger('price', 'Cena')
            ->setHtmlType('range')
            ->setHtmlAttribute('min', $filterParams['price']['min'])
            ->setHtmlAttribute('max', $filterParams['price']['max'])
            ->setHtmlAttribute('step', 1)
            ->setHtmlAttribute('value', $filterParams['price']['max'])
            ->setHtmlAttribute('oninput', 'this.nextElementSibling.value = this.value');
        $this->addText('priceOutput', 'Cena')
            ->setHtmlAttribute('readonly', true)
            ->setHtmlAttribute('style', 'border:0; color:#f6931f; font-weight:bold;')
            ->setHtmlAttribute('id', 'priceOutput');


        $this->addSubmit('filter', 'Filtrovat');
    }
}