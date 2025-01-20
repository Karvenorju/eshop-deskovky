<?php

namespace App\Model\Facades;

use App\Model\Entities\Product;
use App\Model\Repositories\ImageRepository;

class ImageFacade {
    private ImageRepository $imageRepository;

    public function __construct(ImageRepository $imageRepository){
        $this->imageRepository=$imageRepository;
    }

    public function getImages(Product $product): array {
        return $this->imageRepository->findAllBy(['product_id'=>$product->getId()]);
    }

}