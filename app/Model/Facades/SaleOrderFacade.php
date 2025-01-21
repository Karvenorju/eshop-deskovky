<?php

namespace App\Model\Facades;

use App\Model\Entities\SaleOrder;
use App\Model\Entities\SaleOrderLine;
use App\Model\Repositories\CartRepository;
use App\Model\Repositories\SaleOrderLineRepository;
use App\Model\Repositories\SaleOrderRepository;
use Dibi\DateTime;
use Exception;
use LeanMapper\Connection;

class SaleOrderFacade {
    private SaleOrderRepository $saleOrderRepository;
    private SaleOrderLineRepository $saleOrderLineRepository;
    private CartRepository $cartRepository;
    private Connection $db;
    private ProductsFacade $productsFacade;

    public function __construct(
        SaleOrderRepository     $saleOrderRepository,
        SaleOrderLineRepository $saleOrderLineRepository,
        CartRepository          $cartRepository,
        Connection              $db,
        ProductsFacade          $productsFacade
    ) {
        $this->saleOrderRepository = $saleOrderRepository;
        $this->saleOrderLineRepository = $saleOrderLineRepository;
        $this->cartRepository = $cartRepository;
        $this->productsFacade = $productsFacade;
        $this->db = $db;
    }

    /**
     * Generates a unique sale order name.
     * Format: SO-YYYYMMDD-XXXXXX (e.g., SO-20250119-000001)
     *
     * @return string
     */
    public function generateOrderName(): string {
        // Get today's date
        $date = date('Ymd');
        // Fetch number of orders created today
        $orderCount = $this->saleOrderRepository->countOrdersToday();
        // Increment for the new order
        $orderNumber = str_pad($orderCount + 1, 6, '0', STR_PAD_LEFT);
        return "SO-{$date}-{$orderNumber}";
    }

    public function getOrdersByUserId(int $userId): array {
        $where = ['user_id => ?', $userId];
        $orders = $this->saleOrderRepository->findAll();
        return $orders ?: []; // Ensure an array is always returned
    }

    /**
     * Creates an order from a cart using transaction rollback if needed.
     *
     * @param array $orderData User input data (name, email, address, etc.)
     * @param int $cartId ID of the cart
     * @return SaleOrder Created order
     * @throws Exception If the transaction fails
     */
    public function createOrder(array $orderData, int $cartId): SaleOrder {
        try {
            $this->db->begin(); // Start transaction

            // Fetch the cart
            $cart = $this->cartRepository->find($cartId);
            if (!$cart || empty($cart->items)) {
                throw new Exception('Cart is empty or does not exist.');
            }

            // Create a new SaleOrder entity
            $order = new SaleOrder();
            $order->status = SaleOrder::STATUS_PENDING;
            $order->orderName = $this->generateOrderName();
            $order->user = $orderData['user'] ?? null;
            $order->totalPrice = $cart->getTotalPrice();
            $order->createdAt = new DateTime();
            // customer info
            $order->customerName = $orderData['customerName'];
            $order->customerEmail = $orderData['customerEmail'];
            $order->customerPhone = $orderData['customerPhone'] ?? null;
            $order->customerAddress = $orderData['customerAddress'];

            // Save the order
            $this->saleOrderRepository->persist($order);

            // Convert cart items to SaleOrderLine entities
            foreach ($cart->items as $cartItem) {
                $orderItem = new SaleOrderLine();
                $orderItem->saleOrder = $order;
                $orderItem->product = $cartItem->product;
                $orderItem->quantity = $cartItem->count;
                $orderItem->price = $cartItem->product->price;

                // Zvýšení počtu prodaných kusů u produktů
                $orderedProductEntity = $this->productsFacade->getProduct($cartItem->product->productId);
                $orderedQuantity = $cartItem->count;
                $orderedProductEntity->soldQuantity = $orderedProductEntity->soldQuantity + $orderedQuantity;
                $this->productsFacade->saveProduct($orderedProductEntity);

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

    public function getOrderById(int $id): ?SaleOrder {
        return $this->saleOrderRepository->find($id);
    }

    /**
     * Metoda pro vyhledání objednávek
     * @param array|null $params = null
     * @param int $offset = null
     * @param int $limit = null
     * @return SaleOrder[]
     */
    public function findOrders(array $params = null, int $offset = null, int $limit = null): array {
        $whereArr = [];
        if (isset($params['status']) && $params['status'] !== '') {
            $whereArr[] = ['LOWER(status) = LOWER(?)', $params['status']];
        }
        if (isset($params['orderName']) && $params['orderName'] !== '') {
            $whereArr[] = ['LOWER(order_name) LIKE LOWER(?)', '%' . $params['orderName'] . '%'];
        }
        if (isset($params['customerEmail']) && $params['customerEmail'] !== '') {
            $whereArr[] = ['LOWER(customer_email) LIKE LOWER(?)', '%' . $params['customerEmail'] . '%'];
        }
        if (isset($params['dateFrom']) && $params['dateFrom'] !== '') {
            $whereArr[] = ['created_at >= ?', $params['dateFrom']];
        }
        if (isset($params['dateTo']) && $params['dateTo'] !== '') {
            $whereArr[] = ['created_at <= ?', $params['dateTo']];
        }

        return $this->saleOrderRepository->findAllBy($whereArr, $offset, $limit);
    }

    public function updateOrderStatus(int $orderId, string $status): void {
        $order = $this->saleOrderRepository->find($orderId);
        if ($order) {
            $order->status = $status;
            $this->saleOrderRepository->persist($order);
        }
    }
}
