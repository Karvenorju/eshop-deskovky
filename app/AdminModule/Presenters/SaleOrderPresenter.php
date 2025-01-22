<?php

namespace App\AdminModule\Presenters;


use App\AdminModule\Components\SaleOrderListFilterForm\SaleOrderListFilterForm;
use App\AdminModule\Components\SaleOrderListFilterForm\SaleOrderListFilterFormFactory;
use App\Model\Facades\SaleOrderFacade;

/**
 * Class SaleOrderPresenter
 * @package App\AdminModule\Presenters
 */
class SaleOrderPresenter extends BasePresenter {
    private SaleOrderFacade $saleOrderFacade;
    private saleOrderListFilterFormFactory $saleOrderListFilterFormFactory;

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

    public function handleUpdateStatus(int $orderId, string $status): void {
        $this->saleOrderFacade->updateOrderStatus($orderId, $status);
        $this->flashMessage('Stav objednávky byl úspěšně aktualizován.', 'success');
        $this->redirect('this', ['orderId' => $orderId]);
    }

    protected function createComponentSaleOrderListFilterForm(): SaleOrderListFilterForm {
        $form = $this->saleOrderListFilterFormFactory->create();
        $form->onSubmit[] = function (SaleOrderListFilterForm $form) {
            $values = $form->getValues(true);
            $this->redirect('this', $values);
        };

        return $form;
    }

    #region injections
    public function injectSaleOrderFacade(SaleOrderFacade $saleOrderFacade): void {
        $this->saleOrderFacade = $saleOrderFacade;
    }

    public function injectSaleOrderListFilterFormFactory(SaleOrderListFilterFormFactory $saleOrderListFilterFormFactory): void {
        $this->saleOrderListFilterFormFactory = $saleOrderListFilterFormFactory;
    }
    #endregion injections

}
