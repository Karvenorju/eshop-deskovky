<?php

namespace App\Model\Facades;

use App\Model\Entities\SaleOrder;
use App\Model\Entities\SaleOrderLine;
use App\Model\Repositories\SaleOrderRepository;
use App\Model\Repositories\SaleOrderLineRepository;
use App\Model\Repositories\CartRepository;
use Dibi\DateTime;
use LeanMapper\Connection;
use Exception;

class SaleOrderFacade
{
    private SaleOrderRepository $saleOrderRepository;
    private SaleOrderLineRepository $saleOrderLineRepository;
    private CartRepository $cartRepository;
    private Connection $db;

    public function __construct(
        SaleOrderRepository $saleOrderRepository,
        SaleOrderLineRepository $saleOrderLineRepository,
        CartRepository $cartRepository,
        Connection $db
    ) {
        $this->saleOrderRepository = $saleOrderRepository;
        $this->saleOrderLineRepository = $saleOrderLineRepository;
        $this->cartRepository = $cartRepository;
        $this->db = $db;
    }

    /**
     * Creates an order from a cart using transaction rollback if needed.
     *
     * @param array $orderData User input data (name, email, address, etc.)
     * @param int $cartId ID of the cart
     * @return SaleOrder Created order
     * @throws Exception If the transaction fails
     */
    public function createOrder(array $orderData, int $cartId): SaleOrder
    {
        try {
            $this->db->begin(); // Start transaction

            // Fetch the cart
            $cart = $this->cartRepository->find($cartId);
            if (!$cart || empty($cart->items)) {
                throw new Exception('Cart is empty or does not exist.');
            }

            // Create a new SaleOrder entity
            $order = new SaleOrder();
            $order->userId = $orderData['userId'] ?? null;
            $order->name = $orderData['name'];
            $order->email = $orderData['email'] ?? null;
            $order->phone = $orderData['phone'] ?? null;
            $order->address = $orderData['address'];
            $order->totalPrice = $cart->getTotalPrice();
            $order->createdAt = new DateTime();

            // Save the order
            $this->saleOrderRepository->persist($order);

            // Convert cart items to SaleOrderLine entities
            foreach ($cart->items as $cartItem) {
                $orderItem = new SaleOrderLine();
                $orderItem->saleOrder = $order;
                $orderItem->product = $cartItem->product;
                $orderItem->quantity = $cartItem->count;
                $orderItem->price = $cartItem->product->price;

                // Ensure quantity and price are valid
                if ($orderItem->quantity <= 0) {
                    throw new Exception('Invalid quantity for product ID ' . $orderItem->productId);
                }
                if ($orderItem->price < 0) {
                    throw new Exception('Invalid price for product ID ' . $orderItem->productId);
                }

                $this->saleOrderLineRepository->persist($orderItem);
            }

            // Remove the cart
            $this->cartRepository->delete($cart);

            $this->db->commit(); // Commit transaction
            return $order;

        } catch (Exception $e) {
            $this->db->rollback(); // Rollback transaction if an error occurs
            throw new Exception('Order creation failed: ' . $e->getMessage());
        }
    }
}
