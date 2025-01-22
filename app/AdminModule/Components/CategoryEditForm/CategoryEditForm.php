<?php

namespace App\AdminModule\Components\CategoryEditForm;

use App\Model\Entities\Category;
use App\Model\Facades\CategoriesFacade;
use Nette;
use Nette\Application\UI\Form;
use Nette\Forms\Controls\SubmitButton;
use Nette\SmartObject;
use Nextras\FormsRendering\Renderers\Bs4FormRenderer;
use Nextras\FormsRendering\Renderers\FormLayout;

/**
 * Class CategoryEditForm
 * @package App\AdminModule\Components\CategoryEditForm
 *
 * @method onFinished(string $message = '')
 * @method onFailed(string $message = '')
 * @method onCancel()
 */
class CategoryEditForm extends Form {

    use SmartObject;

    /** @var callable[] $onFinished */
    public array $onFinished = [];
    /** @var callable[] $onFailed */
    public array $onFailed = [];
    /** @var callable[] $onCancel */
    public array $onCancel = [];

    private CategoriesFacade $categoriesFacade;

    /**
     * CategoryEditForm constructor.
     * @param CategoriesFacade $categoriesFacade
     * @param Nette\ComponentModel\IContainer|null $parent
     * @param string|null $name
     */
    public function __construct(CategoriesFacade $categoriesFacade, Nette\ComponentModel\IContainer $parent = null, string $name = null) {
        parent::__construct($parent, $name);
        $this->setRenderer(new Bs4FormRenderer(FormLayout::VERTICAL));
        $this->categoriesFacade = $categoriesFacade;
        $this->createSubcomponents();
    }

    private function createSubcomponents(): void {
        $categoryId = $this->addHidden('categoryId');
        $this->addText('title', 'Název kategorie')
            ->setRequired('Musíte zadat název kategorie');
        $this->addTextArea('description', 'Popis kategorie')
            ->setRequired(false);

        #region obrázek
        $photoUpload = $this->addUpload('photo', 'Fotka kategorie');
        //vyžadování nahrání souboru, pokud není známé categoryId
        $photoUpload
            ->addConditionOn($categoryId, Form::EQUAL, '')
            ->setRequired('Pro uložení nové kategorie je nutné nahrát její fotku.');

        //limit pro velikost nahrávaného souboru
        $photoUpload
            ->addRule(Form::MAX_FILE_SIZE, 'Nahraný soubor je příliš velký', 1000000);

        //kontrola typu nahraného souboru, pokud je nahraný
        $photoUpload
            ->addCondition(Form::FILLED)
            ->addRule(function (Nette\Forms\Controls\UploadControl $photoUpload) {
                $uploadedFile = $photoUpload->value;
                if ($uploadedFile instanceof Nette\Http\FileUpload) {
                    $extension = strtolower($uploadedFile->getSuggestedExtension());
                    return in_array($extension, ['jpg', 'jpeg', 'png']);
                }
                return false;
            }, 'Je nutné nahrát obrázek ve formátu JPEG či PNG.');
        #endregion obrázek

        $this->addSubmit('ok', 'uložit')
            ->onClick[] = function (SubmitButton $button) {
            $values = $this->getValues('array');
            if (!empty($values['categoryId'])) {
                try {
                    $category = $this->categoriesFacade->getCategory($values['categoryId']);
                } catch (\Exception $e) {
                    $this->onFailed('Požadovaná kategorie nebyla nalezena.');
                    return;
                }
            } else {
                $category = new Category();
            }

            //uložení fotky
            if (($values['photo'] instanceof Nette\Http\FileUpload) && ($values['photo']->isOk())) {
                $fileUpload = $values['photo'];
                $fileName = $fileUpload->sanitizedName;
                $category->imageUrl = $fileName;

                $fileUpload->move(__DIR__ . '/../../../../www/img/categories/' . $fileName);
            }

            $category->assign($values, ['title', 'description']);
            $this->categoriesFacade->saveCategory($category);
            $this->setValues(['categoryId' => $category->categoryId]);
            $this->onFinished('Kategorie byla uložena.');
        };
        $this->addSubmit('storno', 'zrušit')
            ->setValidationScope([$categoryId])
            ->onClick[] = function (SubmitButton $button) {
            $this->onCancel();
        };
    }

    /**
     * Metoda pro nastavení výchozích hodnot formuláře
     * @param Category|array|object $values
     * @param bool $erase = false
     * @return $this
     */
    public function setDefaults($values, bool $erase = false): self {
        if ($values instanceof Category) {
            $values = [
                'categoryId' => $values->categoryId,
                'title' => $values->title,
                'description' => $values->description
            ];
        }
        parent::setDefaults($values, $erase);
        return $this;
    }

}