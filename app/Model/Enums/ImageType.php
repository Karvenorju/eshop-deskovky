<?php

namespace App\Model\Enums;

enum ImageType: string {
    case FRONT = 'front';
    case BACK = 'back';
    case BOARD = 'board';
    case OTHER = 'other';
}
