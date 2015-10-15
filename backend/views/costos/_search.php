<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\search\CostosSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="costos-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'cAnalisis') ?>

    <?= $form->field($model, 'cMuestreo') ?>

    <?= $form->field($model, 'cInforme') ?>

    <?= $form->field($model, 'cAdministrativo') ?>

    <?php // echo $form->field($model, 'utilidad') ?>

    <?php // echo $form->field($model, 'rendimiento') ?>

    <?php // echo $form->field($model, 'General_id') ?>

    <?php // echo $form->field($model, 'CostoParametro_id') ?>

    <?php // echo $form->field($model, 'CostoParametro_Parametros_id') ?>

    <?php // echo $form->field($model, 'CostoMuestra_id') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('models', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('models', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
