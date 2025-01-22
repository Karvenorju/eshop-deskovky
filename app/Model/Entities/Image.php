<?php

namespace App\Model\Entities;

use LeanMapper\Entity;

/**
 * Class Image
 * @package App\Model\Entities
 * @property int $imageId
 * @property string $url
 * @property string $type
 * @property Product $product m:hasOne
 */
class Image extends Entity {

}