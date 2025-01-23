<?php

namespace App\Model\Entities;

use App\Model\Enums\ImageType;
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
 * @property int|null $bggId = null
 * @property Image[] $images m:belongsToMany = []
 */
class Product extends Entity implements \Nette\Security\Resource {

    /**
     * @inheritDoc
     */
    function getResourceId(): string {
        return 'Product';
    }

    /**
     * Get the URL of the front image
     *
     * @return string
     */
    public function getFrontImageUrl(): string {
        $frontImage = array_filter($this->images, fn($image) => $image->type === ImageType::FRONT->value);
        $frontImage = reset($frontImage);
        return $frontImage ? $frontImage->url : '';
    }
}