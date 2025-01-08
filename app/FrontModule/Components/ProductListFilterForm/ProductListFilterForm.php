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
        // Get filter parameters
        $filterParams = $this->productsFacade->getFilterParams();
        asort($filterParams['categories']);
        asort($filterParams['player']['min']);
        asort($filterParams['player']['max']);
        asort($filterParams['age']);

        // Category (checkboxes)
        $this->addCheckboxList('category', 'Category', $filterParams['categories']);

        // Price (slider)
        $this->addInteger('price', 'Cena (Kč)')
            ->setHtmlType('range')
            ->setHtmlAttribute('min', $filterParams['price']['min'])
            ->setHtmlAttribute('max', $filterParams['price']['max'])
            ->setHtmlAttribute('step', 1)
            ->setDefaultValue($filterParams['price']['max'])
            ->setHtmlAttribute('oninput', 'updateSliderValue(this.value, "priceSliderValue")');

            $this->addText('priceSliderValue')
            ->setHtmlAttribute('id', 'priceSliderValue')
            ->setHtmlAttribute('readonly', true)
            ->setHtmlAttribute('value', $filterParams['price']['max']);

        // Number of players (min radio, max radio)
        $this->addRadioList('minPlayer', 'Minimální počet hráčů', $filterParams['player']['min']);
        $this->addRadioList('maxPlayer', 'Maximální počet hráčů', $filterParams['player']['max']);

        // Age (radio)
        $this->addRadioList('age', 'Věk', $filterParams['age']);

        // Play time (slider)
        $this->addInteger('playTime', 'Doba hraní (minuty)')
            ->setHtmlType('range')
            ->setHtmlAttribute('min', $filterParams['playTime']['min'])
            ->setHtmlAttribute('max', $filterParams['playTime']['max'])
            ->setHtmlAttribute('step', 1)
            ->setHtmlAttribute('value', $filterParams['playTime']['max'])
            ->setDefaultValue($filterParams['playTime']['max'])
            ->setHtmlAttribute('oninput', 'updateSliderValue(this.value, "playTimeSliderValue")');

        $this->addText('playTimeSliderValue')
            ->setHtmlAttribute('id', 'playTimeSliderValue')
            ->setHtmlAttribute('readonly', true)
            ->setHtmlAttribute('value', $filterParams['playTime']['max']);

        $this->addSubmit('filter', 'Filtrovat');
    }
}