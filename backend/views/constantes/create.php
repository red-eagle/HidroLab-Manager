<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Constantes */

$this->title = Yii::t('models', 'Create Constantes');
$this->params['breadcrumbs'][] = ['label' => Yii::t('models', 'Constantes'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="constantes-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
