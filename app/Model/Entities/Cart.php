<?php

namespace App\Model\Entities;

use Dibi\DateTime;
use LeanMapper\Entity;

/**
 * Class Cart
 * @package App\Model\Entities
 * @property int $cartId
 * @property int|null $userId = null
 * @property CartItem[] $items m:belongsToMany
 * @property DateTime|null $lastModified
 */
class Cart extends Entity
{

    private const SHIPPING_COST = 100;
    private const TAX_RATE = 0.21; // 21%

    public function updateCartItems()
    {
        $this->row->cleanReferencingRowsCache('cart_item'); //smažeme cache, aby se položky v košíku znovu načetly z DB bez nutnosti načtení celého košíku
    }

    public function getTaxRate(): float {
        return self::TAX_RATE;
    }

    /**
     * Get the fixed shipping cost.
     * @return int
     */
    public function getShippingCost(): int
    {
        return self::SHIPPING_COST;
    }

    /**
     * Calculate tax based on subtotal.
     * @return float
     */
    public function getTax(): float
    {
        return $this->getSubtotal() * $this->getTaxRate();
    }

    /**
     * Calculate total price (subtotal + tax + shipping)
     * @return float
     */
    public function getTotalPrice(): float
    {
        return $this->getSubtotal() + $this->getTax() + self::SHIPPING_COST;
    }

    public function getTotalCount(): int
    {
        $result = 0;
        if (!empty($this->items)) {
            foreach ($this->items as $item) {
                $result += $item->count;
            }
        }
        return $result;
    }

    public function getSubtotal(): float
    {
        $result = 0;
        if (!empty($this->items)) {
            foreach ($this->items as $item) {
                $result += $item->product->price * $item->count;
            }
        }
        return $result;
    }

}