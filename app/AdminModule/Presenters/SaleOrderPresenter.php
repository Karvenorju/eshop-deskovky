<?php

namespace App\AdminModule\Presenters;


use App\AdminModule\Components\SaleOrderListFilterForm\SaleOrderListFilterForm;
use App\AdminModule\Components\SaleOrderListFilterForm\SaleOrderListFilterFormFactory;
use App\AdminModule\Components\SaleOrderStatusForm\SaleOrderStatusFormFactory;
use App\FrontModule\Components\CheckoutForm\CheckoutFormFactory;
use App\Model\Entities\SaleOrder;
use App\Model\Facades\SaleOrderFacade;
use Nette\Forms\Form;
use Nette\InvalidArgumentException;

/**
 * Class SaleOrderPresenter
 * @package App\AdminModule\Presenters
 */
class SaleOrderPresenter extends BasePresenter {
    private SaleOrderFacade $saleOrderFacade;
    private saleOrderListFilterFormFactory $saleOrderListFilterFormFactory;

    private saleOrderStatusFormFactory $saleOrderStatusFormFactory;

    /**
     * Akce pro vykreslení seznamu objednávek
     */
    public function renderDefault(): void {
        $filterParams = $this->getHttpRequest()->getPost(); // Retrieve GET parameters
        $this->template->orders = $this->saleOrderFacade->findOrders($filterParams);
        $this->template->filterParams = $filterParams; // Pass to template for pre-filling the form
    }

    public function renderEdit(int $orderId): void {
        $order = $this->saleOrderFacade->getOrderById($orderId);
        $this->template->order = $order;
    }

    protected function createComponentSaleOrderStatusForm(): \Nette\Application\UI\Form
    {
        $orderId = $this->getParameter('orderId');

        // Fetch the order from the facade
        $order = $this->saleOrderFacade->getOrderById($orderId);
        if (!$order) {
            $this->error('Order not found.');
        }

        // Pass the order to the factory method
        $form = $this->saleOrderStatusFormFactory->create($order);
        $form->onSuccess[] = [$this, 'processUpdateStatusForm'];

        return $form;
    }

    protected function createComponentSaleOrderListFilterForm(): SaleOrderListFilterForm {
        $form = $this->saleOrderListFilterFormFactory->create();
        $form->onSubmit[] = function (SaleOrderListFilterForm $form) {
            $values = $form->getValues(true);
            $this->redirect('this', $values);
        };

        return $form;
    }


    public function processUpdateStatusForm(Form $form, array $values): void
    {
        $order = $this->saleOrderFacade->getOrderById($values['orderId']);
        try {
            $this->saleOrderFacade->updateOrderStatus($order, $values['status']);
            $this->flashMessage('Stav objednávky byl úspěšně změněn.', 'success');
        } catch (InvalidArgumentException $e) {
            $this->flashMessage('Nelze změnit stav objednávky: ' . $e->getMessage(), 'warning');
        }

        $this->redirect('this');
    }

    #region injections
    public function injectSaleOrderFacade(SaleOrderFacade $saleOrderFacade): void {
        $this->saleOrderFacade = $saleOrderFacade;
    }

    public function injectSaleOrderListFilterFormFactory(SaleOrderListFilterFormFactory $saleOrderListFilterFormFactory): void {
        $this->saleOrderListFilterFormFactory = $saleOrderListFilterFormFactory;
    }

    public function injectSaleOrderStatusFormFactory(SaleOrderStatusFormFactory $factory): void {
        $this->saleOrderStatusFormFactory = $factory;
    }
    #endregion injections

}
