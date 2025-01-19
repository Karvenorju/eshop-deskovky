<?php

namespace App\Model\Entities;

use LeanMapper\Entity;

/**
 * Class Product
 * @package App\Model\Entities
 * @property int $productId
 * @property string $title
 * @property string $url
 * @property string $description
 * @property float $price
 * @property Category|null $category m:hasOne
 * @property int $minPlayer
 * @property int $maxPlayer
 * @property int $playTime
 * @property int $minAge
 * @property int $soldQuantity
 */
class Product extends Entity implements \Nette\Security\Resource {

    /**
     * @inheritDoc
     */
    function getResourceId(): string {
        return 'Product';
    }
}