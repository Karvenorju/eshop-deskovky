<?php

namespace App\Model\Entities;

use Dibi\DateTime;
use LeanMapper\Entity;

/**
 * Class SaleOrder
 * @package App\Model\Entities
 *
 * @property int $saleOrderId
 * @property User|null $user m:hasOne
 * @property string $orderName
 * @property string $customerName
 * @property string $customerEmail
 * @property string|null $customerPhone
 * @property string $customerAddress
 * @property float $totalPrice
 * @property DateTime $createdAt
 * @property string $status = 'pending' m:Enum(self::STATUS_*)  <-- Enforcing ENUM values
 * @property SaleOrderLine[] $items m:belongsToMany
 */
class SaleOrder extends Entity
{

    const STATUS_PENDING = 'pending';
    const STATUS_SHIPPED = 'shipped';
    const STATUS_DONE = 'done';
    const STATUS_CANCELLED = 'cancelled';

    /**
     * Returns all valid statuses.
     */
    public static function getAvailableStatuses(): array
    {
        return [
            self::STATUS_PENDING,
            self::STATUS_SHIPPED,
            self::STATUS_DONE,
            self::STATUS_CANCELLED,
        ];
    }
    public function getTotalPrice(): float
    {
        $total = 0;
        if (!empty($this->items)) {
            foreach ($this->items as $item) {
                $total += $item->price * $item->quantity;
            }
        }
        return $total;
    }
}
