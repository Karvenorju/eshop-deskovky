<?php

namespace App\Model\Entities;

use LeanMapper\Entity;

/**
 * Class User
 * @package App\Model\Entities
 * @property int $userId
 * @property string $name
 * @property Role|null $role m:hasOne
 * @property string $email
 * @property string|null $facebookId = null
 * @property string|null $password = null
 * @property string|null $phone = null
 * @property string|null $address = null
 */
class User extends Entity {

}