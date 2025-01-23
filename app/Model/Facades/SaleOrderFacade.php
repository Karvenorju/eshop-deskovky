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
use Nette\Bridges\ApplicationLatte\LatteFactory;
use Nette\InvalidArgumentException;
use Nette\Mail\Message;
use Nette\Mail\SendmailMailer;

class SaleOrderFacade
{
    private SaleOrderRepository $saleOrderRepository;
    private SaleOrderLineRepository $saleOrderLineRepository;
    private CartRepository $cartRepository;
    private Connection $db;
    private ProductsFacade $productsFacade;
    private CategoriesFacade $categoriesFacade;
    private LatteFactory $latteFactory;

    private string $emailFrom; // from mailFrom config
    private string $emailName; // from mailFrom config

    public function __construct(
        string                  $email,
        string                  $name,
        SaleOrderRepository     $saleOrderRepository,
        SaleOrderLineRepository $saleOrderLineRepository,
        CartRepository          $cartRepository,
        Connection              $db,
        ProductsFacade          $productsFacade,
        CategoriesFacade        $categoriesFacade,
        LatteFactory            $latteFactory,
    )
    {
        $this->saleOrderRepository = $saleOrderRepository;
        $this->saleOrderLineRepository = $saleOrderLineRepository;
        $this->cartRepository = $cartRepository;
        $this->productsFacade = $productsFacade;
        $this->db = $db;
        $this->categoriesFacade = $categoriesFacade;
        $this->emailFrom = $email;
        $this->emailName = $name;
        $this->latteFactory = $latteFactory;
    }


    /**
     * Generates a unique sale order name.
     * Format: SO-YYYYMMDD-XXXXXX (e.g., SO-20250119-000001)
     *
     * @return string
     */
    public function generateOrderName(): string
    {
        // Get today's date
        $date = date('Ymd');
        // Fetch number of orders created today
        $orderCount = $this->saleOrderRepository->countOrdersToday();
        // Increment for the new order
        $orderNumber = str_pad($orderCount + 1, 6, '0', STR_PAD_LEFT);
        return "SO-{$date}-{$orderNumber}";
    }

    public function getOrdersByUserId(int $userId, int $offset = null, int $limit = null): array
    {
        $where = ['user_id' => $userId, 'order' => 'created_at DESC'];
        $orders = $this->saleOrderRepository->findAllBy($where, $offset, $limit);
        return $orders ?: []; // Ensure an array is always returned
    }

    public function countOrdersByUserId(int $userId): int
    {
        $where = ['user_id' => $userId];
        return $this->saleOrderRepository->findCountBy($where);
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

                // Zvýšení počtu prodaných kusů u produktu
                $orderedQuantity = $cartItem->count;
                $orderedProductEntity = $this->productsFacade->getProduct($cartItem->product->productId);
                $orderedProductEntity->soldQuantity = $orderedProductEntity->soldQuantity + $orderedQuantity;
                $this->productsFacade->saveProduct($orderedProductEntity);

                $orderedProductCategoryId = $cartItem->product->category?->categoryId;
                // Zvýšení počtu prodaných kusů u kategorie
                if ($orderedProductCategoryId) {
                    $orderedProductCategoryEntity = $this->categoriesFacade->getCategory($orderedProductCategoryId);
                    $orderedProductCategoryEntity->soldQuantity = $orderedProductCategoryEntity->soldQuantity + $orderedQuantity;
                    $this->categoriesFacade->saveCategory($orderedProductCategoryEntity);
                }

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

    public function getOrderById(int $id): ?SaleOrder
    {
        return $this->saleOrderRepository->find($id);
    }

    private function buildFilterConditions(array $params): array
    {
        $whereArr = [];

        if (!empty($params['status'])) {
            $whereArr[] = ['LOWER(status) = LOWER(?)', $params['status']];
        }

        if (!empty($params['orderName'])) {
            $whereArr[] = ['LOWER(order_name) LIKE LOWER(?)', '%' . $params['orderName'] . '%'];
        }

        if (!empty($params['customerEmail'])) {
            $whereArr[] = ['LOWER(customer_email) LIKE LOWER(?)', '%' . $params['customerEmail'] . '%'];
        }

        if (!empty($params['dateFrom'])) {
            $whereArr[] = ['created_at >= ?', $params['dateFrom']];
        }

        if (!empty($params['dateTo'])) {
            $whereArr[] = ['created_at <= ?', $params['dateTo']];
        }

        // Add ordering only if present in the params
        if (!empty($params['order'])) {
            $whereArr['order'] = $params['order'];
        }

        return $whereArr;
    }



    public function findOrders(array $params = null, int $offset = null, int $limit = null): array
    {
        $whereArr = $this->buildFilterConditions($params);
        return $this->saleOrderRepository->findAllBy($whereArr, $offset, $limit);
    }

    public function countFilteredOrders(array $params = null): int
    {
        $whereArr = $this->buildFilterConditions($params);
        return $this->saleOrderRepository->findCountBy($whereArr);
    }

    public function updateOrderStatus(SaleOrder $order, string $newStatus): void
    {
        if (!in_array($newStatus, $order->getAllowedTransitions())) {
            throw new InvalidArgumentException('Invalid order status transition.');
        }

        $order->status = $newStatus;
        $this->saleOrderRepository->persist($order);
    }


    public function sendOrderConfirmationEmail($order): void
    {
        $latte = $this->latteFactory->create();
        $params = [
            'order' => $order,
            'mailFrom' => $this->emailFrom,
        ];
        $htmlBody = $latte->renderToString(__DIR__ . '/../Templates/emails/orderConfirmation.latte', $params);

        // Create email
        $mail = new Message();
        $mail->setFrom($this->emailFrom, $this->emailName)
            ->addTo($order->customerEmail, $order->customerName)
            ->setSubject("Order {$order->orderName}")
            ->setHtmlBody($htmlBody);
        // Send email
        $mailer = new SendmailMailer();
        $mailer->send($mail);
    }

    public function injectLatteFactory(LatteFactory $latteFactory): void
    {
        $this->latteFactory = $latteFactory;
    }
}
