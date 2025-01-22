<?php

namespace App\Model\Facades;

use App\Model\Entities\Image;
use App\Model\Entities\Product;
use App\Model\Enums\ImageType;
use App\Model\Repositories\ImageRepository;
use Nette\Http\FileUpload;

class ImageFacade {
    private ImageRepository $imageRepository;

    public function __construct(ImageRepository $imageRepository) {
        $this->imageRepository = $imageRepository;
    }

    public function getImages(Product $product): array {
        return $this->imageRepository->findAllBy(['product_id = 8']);
    }

    public function getFrontImage(Product $product): Image {
        return $this->imageRepository->findBy(['product_id' => $product->productId, 'type' => 'front']);
    }

    /**
     * Metoda pro uložení fotky produktu
     * @param FileUpload $fileUpload
     * @param Product $product
     * @throws \Exception
     */
    public function saveProductPhoto(FileUpload $fileUpload, Product $product, ImageType $imageType = ImageType::OTHER): void {
        if ($fileUpload->isOk() && $fileUpload->isImage()) {
            try {
                $image = $this->imageRepository->findBy(['product_id' => $product->productId, 'type' => $imageType]);
            } catch (\Exception $e) {
                $image = new Image();
                $image->product = $product;
                switch ($imageType) {
                    case ImageType::FRONT:
                        $image->type = 'front';
                        $image->url = $product->url . '-front.jpg';
                        break;
                    case ImageType::BACK:
                        $image->type = 'back';
                        $image->url = $product->url . '-back.jpg';
                        break;
                    case ImageType::BOARD:
                        $image->type = 'board';
                        $image->url = $product->url . '-board.jpg';
                        break;
                    case ImageType::OTHER:
                        $image->type = 'other';
                        $image->url = $product->url . '-other.jpg';
                        break;
                }
                $this->imageRepository->persist($image);
            }
            $fileUpload->move(__DIR__ . '/../../../www/img/products/' . $image->url);
        }
    }

}