<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Celular */

$this->title = Yii::t('models', 'Create Celular');
$this->params['breadcrumbs'][] = ['label' => Yii::t('models', 'Celulars'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="celular-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
