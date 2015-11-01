<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Tipo */

$this->title = Yii::t('models', 'Create Tipo');
$this->params['breadcrumbs'][] = ['label' => Yii::t('models', 'Tipos'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="tipo-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
