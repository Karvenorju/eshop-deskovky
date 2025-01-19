<?php

namespace App\Model\Entities;

use LeanMapper\Entity;

/**
 * Class Image
 * @package App\Model\Entities
 * @property string $url
 * @property string $type
 * @property Product $product m:belongsToOne
 */
class Image extends Entity {

}