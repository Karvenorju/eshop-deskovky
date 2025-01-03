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

        // Price (double range slider)
        $this->addText('price', 'Price')
            ->setHtmlAttribute('id', 'price-slider')
            ->setHtmlAttribute('readonly', true)
            ->setHtmlAttribute('min', $filterParams['priceRange']['min'])
            ->setHtmlAttribute('max', $filterParams['priceRange']['max'])
            ->setHtmlAttribute('step', '10')
            ->setHtmlAttribute('multiple', true);


        // Number of players (double range slider)
        $this->addText('players', 'Number of Players')
            ->setHtmlType('range')
            ->setHtmlAttribute('id', 'players-slider')
            ->setHtmlAttribute('readonly', true)
            ->setHtmlAttribute('min', $filterParams['playerRange']['min'])
            ->setHtmlAttribute('max', $filterParams['playerRange']['max'])
            ->setHtmlAttribute('step', '1')
            ->setHtmlAttribute('multiple', true);

        // Age (radio buttons)
        $this->addRadioList('age', 'Age', $filterParams['ageGroups']);

        // Play time (range slider)
        $this->addText('play_time', 'Play Time')
            ->setHtmlType('range')
            ->setHtmlAttribute('min', $filterParams['playTimeRange']['min'])
            ->setHtmlAttribute('max', $filterParams['playTimeRange']['max'])
            ->setHtmlAttribute('step', '10');

        $this->addSubmit('filter', 'Filtrovat');
    }
}