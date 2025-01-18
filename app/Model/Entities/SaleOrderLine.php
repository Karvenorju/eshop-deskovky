<?php

namespace App\Model\Entities;

use InvalidArgumentException;
use LeanMapper\Entity;

/**
 * Class SaleOrderLine
 * @package App\Model\Entities
 *
 * @property int $id
 * @property SaleOrder $saleOrder m:hasOne
 * @property Product $product m:hasOne
 * @property int $quantity = 0
 * @property float $price = 0.0
 */
class SaleOrderLine extends Entity
{
    public function validate(): void
    {
        if ($this->quantity <= 0) {
            throw new InvalidArgumentException('Quantity must be a positive number.');
        }
        if ($this->price < 0) {
            throw new InvalidArgumentException('Price must be non-negative.');
        }
    }
}
