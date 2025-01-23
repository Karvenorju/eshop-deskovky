<?php

namespace App\AdminModule\Components\ProductEditForm;

use App\Model\Entities\Image;
use App\Model\Entities\Product;
use App\Model\Enums\ImageType;
use App\Model\Facades\CategoriesFacade;
use App\Model\Facades\ImageFacade;
use App\Model\Facades\ProductsFacade;
use Nette;
use Nette\Application\UI\Form;
use Nette\Forms\Controls\SubmitButton;
use Nette\SmartObject;
use Nextras\FormsRendering\Renderers\Bs4FormRenderer;
use Nextras\FormsRendering\Renderers\FormLayout;

/**
 * Class ProductEditForm
 * @package App\AdminModule\Components\ProductEditForm
 *
 * @method onFinished(string $message = '')
 * @method onFailed(string $message = '')
 * @method onCancel()
 */
class ProductEditForm extends Form {

    use SmartObject;

    /** @var callable[] $onFinished */
    public array $onFinished = [];
    /** @var callable[] $onFailed */
    public array $onFailed = [];
    /** @var callable[] $onCancel */
    public array $onCancel = [];

    private CategoriesFacade $categoriesFacade;
    private ProductsFacade $productsFacade;
    private ImageFacade $imageFacade;

    /**
     * ProductEditForm constructor.
     * @param CategoriesFacade $categoriesFacade
     * @param ProductsFacade $productsFacade
     * @param Nette\ComponentModel\IContainer|null $parent
     * @param string|null $name
     */
    public function __construct(CategoriesFacade $categoriesFacade, ProductsFacade $productsFacade, ImageFacade $imageFacade, Nette\ComponentModel\IContainer $parent = null, string $name = null) {
        parent::__construct($parent, $name);
        $this->setRenderer(new Bs4FormRenderer(FormLayout::VERTICAL));
        $this->categoriesFacade = $categoriesFacade;
        $this->productsFacade = $productsFacade;
        $this->imageFacade = $imageFacade;
        $this->createSubcomponents();
    }

    private function createSubcomponents(): void {
        $productId = $this->addHidden('productId');
        $this->addText('title', 'Název produktu')
            ->setRequired('Musíte zadat název produktu')
            ->setMaxLength(100);

        $this->addText('url', 'URL produktu')
            ->setMaxLength(100)
            ->addFilter(function (string $url) {
                return Nette\Utils\Strings::webalize($url);
            })
            ->addRule(function (Nette\Forms\Controls\TextInput $input) use ($productId) {
                try {
                    $existingProduct = $this->productsFacade->getProductByUrl($input->value);
                    return $existingProduct->productId == $productId->value;
                } catch (\Exception $e) {
                    return true;
                }
            }, 'Zvolená URL je již obsazena jiným produktem');

        #region kategorie
        $categories = $this->categoriesFacade->findCategories();
        $categoriesArr = [];
        foreach ($categories as $category) {
            $categoriesArr[$category->categoryId] = $category->title;
        }
        $this->addSelect('categoryId', 'Kategorie', $categoriesArr)
            ->setPrompt('--vyberte kategorii--')
            ->setRequired(false);
        #endregion kategorie

        $this->addTextArea('description', 'Popis produktu')
            ->setRequired('Zadejte popis produktu.');

        $this->addText('price', 'Cena')
            ->setHtmlType('number')
            ->addRule(Form::NUMERIC, 'Musíte zadat číslo.')
            ->setRequired('Musíte zadat cenu produktu');//tady by mohly být další kontroly pro min, max atp.
        //min_player, max_player, age, play_time
        $this->addText('minPlayer', 'Minimální počet hráčů')
            ->setHtmlType('number')
            ->addRule(Form::NUMERIC, 'Musíte zadat číslo.');
        $this->addText('maxPlayer', 'Maximální počet hráčů')
            ->setHtmlType('number')
            ->addRule(Form::NUMERIC, 'Musíte zadat číslo.');
        $this->addText('minAge', 'Minimální věk')
            ->setHtmlType('number')
            ->addRule(Form::NUMERIC, 'Musíte zadat číslo.');
        $this->addText('playTime', 'Doba hraní (minuty)')
            ->setHtmlType('number')
            ->addRule(Form::NUMERIC, 'Musíte zadat číslo.');

        #region obrázek
        $photoUpload = [];

        $photoUpload[] = $this->addUpload('photoFront', 'Fotka přední strany produktu');
        $photoUpload[] = $this->addUpload('photoBack', 'Fotka zadní strany produktu');
        $photoUpload[] = $this->addUpload('photoBoard', 'Fotka rozebraného produktu');
        foreach ($photoUpload as $photo) {
            $photo //vyžadování nahrání souboru, pokud není známé productId
            ->addConditionOn($productId, Form::EQUAL, '')
                ->setRequired('Pro uložení nového produktu je nutné nahrát všechny fotky.');

        }

        $photoUpload[0] //limit pro velikost nahrávaného souboru
        ->addRule(Form::MAX_FILE_SIZE, 'Nahraný soubor přední strany příliš velký', 1000000);
        $photoUpload[1] //limit pro velikost nahrávaného souboru
        ->addRule(Form::MAX_FILE_SIZE, 'Nahraný soubor zadní strany příliš velký', 1000000);
        $photoUpload[2] //limit pro velikost nahrávaného souboru
        ->addRule(Form::MAX_FILE_SIZE, 'Nahraný soubor rozebraného produktu příliš velký', 1000000);


        foreach ($photoUpload as $photo) {
            $photo //kontrola typu nahraného souboru, pokud je nahraný
            ->addCondition(Form::FILLED)
                ->addRule(function (Nette\Forms\Controls\UploadControl $photoUpload) {
                    $uploadedFile = $photoUpload->value;
                    if ($uploadedFile instanceof Nette\Http\FileUpload) {
                        $extension = strtolower($uploadedFile->getSuggestedExtension());
                        return in_array($extension, ['jpg', 'jpeg', 'png']);
                    }
                    return false;
                }, 'Je nutné nahrát obrázek ve formátu JPEG či PNG.');
        }

        #endregion obrázek

        $this->addSubmit('ok', 'uložit')
            ->onClick[] = function (SubmitButton $button) {
            $values = $this->getValues('array');
            if (!empty($values['productId'])) {
                try {
                    $product = $this->productsFacade->getProduct($values['productId']);
                } catch (\Exception $e) {
                    $this->onFailed('Požadovaný produkt nebyl nalezen.');
                    return;
                }
            } else {
                $product = new Product();
            }
            $product->assign($values, ['title', 'url', 'description']);
            $product->price = floatval($values['price']);
            $product->minPlayer = intval($values['minPlayer']);
            $product->maxPlayer = intval($values['maxPlayer']);
            $product->minAge = intval($values['minAge']);
            $product->playTime = intval($values['playTime']);
            try {
                $product->category = $this->categoriesFacade->getCategory($values['categoryId']);
            } catch (\Exception $e) {
                $this->onFailed('Kategorie nebyla nalezena.');
                return;
            }
            $this->productsFacade->saveProduct($product);
            $this->setValues(['productId' => $product->productId]);

            //uložení fotky
            if (($values['photoFront'] instanceof Nette\Http\FileUpload) && ($values['photoFront']->isOk())) {
                try {
                    $this->imageFacade->saveProductPhoto($values['photoFront'], $product, ImageType::FRONT);
                } catch (\Exception $e) {
                    $this->onFailed($e->getMessage());
//                    $this->onFailed('Produkt byl uložen, ale nepodařilo se uložit jeho přední fotku.');
                }
            }
            if (($values['photoBack'] instanceof Nette\Http\FileUpload) && ($values['photoBack']->isOk())) {
                try {
                    $this->imageFacade->saveProductPhoto($values['photoBack'], $product, ImageType::BACK);
                } catch (\Exception $e) {
                    $this->onFailed('Produkt byl uložen, ale nepodařilo se uložit jeho zadní fotku.');
                }
            }
            if (($values['photoBoard'] instanceof Nette\Http\FileUpload) && ($values['photoBoard']->isOk())) {
                try {
                    $this->imageFacade->saveProductPhoto($values['photoBoard'], $product, ImageType::BOARD);
                } catch (\Exception $e) {
                    $this->onFailed('Produkt byl uložen, ale nepodařilo se uložit jeho fotku.');
                }
            }

            $this->onFinished('Produkt byl uložen.');
        };
        $this->addSubmit('storno', 'zrušit')
            ->setValidationScope([$productId])
            ->onClick[] = function (SubmitButton $button) {
            $this->onCancel();
        };
    }

    /**
     * Metoda pro nastavení výchozích hodnot formuláře
     * @param Product|array|object $values
     * @param bool $erase = false
     * @return $this
     */
    public function setDefaults($values, bool $erase = false): self {
        if ($values instanceof Product) {
            $values = [
                'productId' => $values->productId,
                'categoryId' => $values->category ? $values->category->categoryId : null,
                'title' => $values->title,
                'url' => $values->url,
                'description' => $values->description,
                'price' => $values->price
            ];
        }
        parent::setDefaults($values, $erase);
        return $this;
    }

}