<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\search\PeticionSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="peticion-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'fPeticion') ?>

    <?= $form->field($model, 'cadena') ?>

    <?= $form->field($model, 'fVencimiento') ?>

    <?= $form->field($model, 'fCreacion') ?>

    <?php // echo $form->field($model, 'referencia_id') ?>

    <?php // echo $form->field($model, 'costos_id') ?>

    <?php // echo $form->field($model, 'costos_General_id') ?>

    <?php // echo $form->field($model, 'costos_CostoParametro_id') ?>

    <?php // echo $form->field($model, 'costos_CostoParametro_Parametros_id') ?>

    <?php // echo $form->field($model, 'costos_costoMuestra_id') ?>

    <?php // echo $form->field($model, 'General_id') ?>

    <?php // echo $form->field($model, 'Muestras_id') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('models', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('models', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
