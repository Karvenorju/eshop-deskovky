<?php

namespace App\AdminModule\Components\SaleOrderStatusForm;

use Nette\Application\UI\Form;
use Nette\SmartObject;
use Nextras\FormsRendering\Renderers\Bs4FormRenderer;
use Nextras\FormsRendering\Renderers\FormLayout;
use App\Model\Entities\SaleOrder;

class SaleOrderStatusForm extends Form
{
    use SmartObject;

    public function __construct(SaleOrder $order, $parent = null, $name = null)
    {
        parent::__construct($parent, $name);
        $this->setRenderer(new Bs4FormRenderer(FormLayout::VERTICAL));
        $this->createSubcomponents($order);
    }

    private function createSubcomponents(SaleOrder $order): void
    {
        // Hidden field for order ID
        $this->addHidden('orderId', (string) $order->saleOrderId);
        // Dropdown with all possible statuses
        $this->addSelect('status', 'Stav objednávky:', [
            SaleOrder::STATUS_PENDING => 'Čeká na vyřízení',
            SaleOrder::STATUS_SHIPPED => 'Odesláno',
            SaleOrder::STATUS_DONE => 'Dokončeno',
            SaleOrder::STATUS_CANCELLED => 'Zrušeno'
        ])
            ->setRequired()
            ->setDefaultValue($order->status);

        // Submit button
        $this->addSubmit('submit', 'Uložit změny');
    }
}
