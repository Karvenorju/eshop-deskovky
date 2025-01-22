<?php

namespace App\AdminModule\Components\SaleOrderListFilterForm;

use Nette\Forms\Form;
use Nette\SmartObject;
use Nextras\FormsRendering\Renderers\Bs4FormRenderer;
use Nextras\FormsRendering\Renderers\FormLayout;

class SaleOrderListFilterForm extends Form
{
    use SmartObject;

    public function __construct($parent = null, $name = null)
    {
        parent::__construct($parent, $name);
        $this->setRenderer(new Bs4FormRenderer(FormLayout::VERTICAL));
        $this->createSubcomponents();
    }

    private function createSubcomponents()
    {
// Filter by status
        $this->addSelect('status', 'Stav objednávky:', [
            '' => 'Všechny',
            'pending' => 'Čeká na vyřízení',
            'done' => 'Dokončené',
            'cancelled' => 'Zrušené',
        ]);

// Search by order name
        $this->addText('orderName', 'Název objednávky:')
            ->setHtmlAttribute('placeholder', 'Zadejte název...');

// Filter by date range
        $this->addText('dateFrom', 'Od:')
            ->setHtmlType('date');
        $this->addText('dateTo', 'Do:')
            ->setHtmlType('date');

// Submit button
        $this->addSubmit('filter', 'Filtrovat');
    }
}
