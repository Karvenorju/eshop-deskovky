<?php

namespace App\Model\Entities;

use Dibi\DateTime;
use LeanMapper\Entity;

/**
 * Class SaleOrder
 * @package App\Model\Entities
 *
 * @property int $id
 * @property int|null $userId
 * @property string $name
 * @property string|null $email
 * @property string $phone
 * @property string $address
 * @property float $totalPrice
 * @property DateTime $createdAt
 * @property SaleOrderLine[] $items m:belongsToMany
 */
class SaleOrder extends Entity
{
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
