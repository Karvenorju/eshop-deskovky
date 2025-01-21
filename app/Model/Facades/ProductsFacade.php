<?php

namespace App\Model\Facades;

use App\Model\Entities\Product;
use App\Model\Repositories\ProductRepository;
use Nette\Http\FileUpload;
use Nette\Utils\Strings;

/**
 * Class ProductsFacade
 * @package App\Model\Facades
 */
class ProductsFacade {
    private ProductRepository $productRepository;

    /**
     * Metoda pro získání jednoho produktu
     * @param int $id
     * @return Product
     * @throws \Exception
     */
    public function getProduct(int $id): Product {
        return $this->productRepository->find($id);
    }

    public function getAllProducts(): array {
        return $this->productRepository->findAll();
    }

    /**
     * Metoda pro získání produktu podle URL
     * @param string $url
     * @return Product
     * @throws \Exception
     */
    public function getProductByUrl(string $url): Product {
        return $this->productRepository->findBy(['url' => $url]);
    }

    /**
     * Metoda pro vyhledání produktů
     * @param array|null $params = null
     * @param int $offset = null
     * @param int $limit = null
     * @return Product[]
     */
    public function findProducts(array $params = null, int $offset = null, int $limit = null): array {
        $whereArr = [];

        if (isset($params['search'])) {
            $whereArr[] = ['title LIKE ?', '%' . $params['search'] . '%'];
        }
        if (isset($params['category']) && is_array($params['category'])) {
            $whereArr[] = ['category_id IN (?)', $params['category']];
        }
        if (isset($params['price'])) {
            $whereArr[] = ['price <= ?', $params['price']];
        }
        if (isset($params['minPlayer'])) {
            $whereArr[] = ['min_player >= ?', $params['minPlayer']];
        }
        if (isset($params['maxPlayer'])) {
            $whereArr[] = ['max_player <= ?', $params['maxPlayer']];
        }
        if (isset($params['age'])) {
            $whereArr[] = ['min_age >= ?', $params['age']];
        }
        if (isset($params['playTime'])) {
            $whereArr[] = ['play_time <= ?', $params['playTime']];
        }
        return $this->productRepository->findAllBy($whereArr, $offset, $limit);
    }

    /**
     * Metoda pro vyhledání nejprodávanějších produktů
     * @param int $limit počet vrácených produktů
     * @return Product[]
     */
    public function findTopProducts(int $limit = 5): array {
        $whereArr = [
            'order' => 'sold_quantity DESC'
        ];

        return $this->productRepository->findAllBy($whereArr, 0, $limit);
    }

    /**
     * Metoda pro zjištění počtu produktů
     * @param array|null $params
     * @return int
     */
    public function findProductsCount(array $params = null): int {
        return $this->productRepository->findCountBy($params);
    }

    /**
     * Metoda pro uložení produktu
     * @param Product &$product
     */
    public function saveProduct(Product &$product): void {
        #region URL produktu
        if (empty($product->url)) {
            //pokud je URL prázdná, vygenerujeme ji podle názvu produktu
            $baseUrl = Strings::webalize($product->title);
        } else {
            $baseUrl = $product->url;
        }

        #region vyhledání produktů se shodnou URL (v případě shody připojujeme na konec URL číslo)
        $urlNumber = 1;
        $url = $baseUrl;
        $productId = isset($product->productId) ? $product->productId : null;
        try {
            while ($existingProduct = $this->getProductByUrl($url)) {
                if ($existingProduct->productId == $productId) {
                    //ID produktu se shoduje => je v pořádku, že je URL stejná
                    $product->url = $url;
                    break;
                }
                $urlNumber++;
                $url = $baseUrl . $urlNumber;
            }
        } catch (\Exception $e) {
            //produkt nebyl nalezen => URL je použitelná
        }
        $product->url = $url;
        #endregion vyhledání produktů se shodnou URL (v případě shody připojujeme na konec URL číslo)
        #endregion URL produktu

        $this->productRepository->persist($product);
    }

    /**
     * Metoda pro uložení fotky produktu
     * @param FileUpload $fileUpload
     * @param Product $product
     * @throws \Exception
     */
    public function saveProductPhoto(FileUpload $fileUpload, Product &$product): void {
        //TODO rework this for new photo architecture
//        if ($fileUpload->isOk() && $fileUpload->isImage()) {
//            $fileExtension = strtolower($fileUpload->getSuggestedExtension());
//            $fileUpload->move(__DIR__ . '/../../../www/img/products/' . $product->productId . '.' . $fileExtension);
//            $product->photoExtension = $fileExtension;
//            $this->saveProduct($product);
//        }
    }

    public function getFilterParams(): array {
        $products = $this->productRepository->findAll();

        $categories = [];
        $prices = [];
        $minPlayer = [];
        $maxPlayer = [];
        $ages = [];
        $playTimes = [];

        foreach ($products as $product) {
            $categories[$product->category->categoryId] = $product->category->title;;
            $prices[] = $product->price;
            $minPlayer[$product->minPlayer] = $product->minPlayer;
            $maxPlayer[$product->maxPlayer] = $product->maxPlayer;
            $ages[$product->minAge] = $product->minAge;
            $playTimes[] = $product->playTime;
        }

        return [
            'categories' => $categories,
            'price' => [
                'min' => min($prices),
                'max' => max($prices)
            ],
            'player' => [
                'min' => (array_unique($minPlayer)),
                'max' => array_unique($maxPlayer)
            ],
            'age' => array_unique($ages),
            'playTime' => [
                'min' => min($playTimes),
                'max' => max($playTimes)
            ]
        ];
    }

    public function __construct(ProductRepository $productRepository) {
        $this->productRepository = $productRepository;
    }
}