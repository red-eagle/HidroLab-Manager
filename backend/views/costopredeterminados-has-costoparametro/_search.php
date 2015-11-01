<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\CostopredeterminadosHasCostoparametroSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="costopredeterminados-has-costoparametro-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'CostoPredeterminados_id') ?>

    <?= $form->field($model, 'CostoParametro_id') ?>

    <?= $form->field($model, 'cantidad') ?>

    <?= $form->field($model, 'k') ?>

    <?= $form->field($model, 'unidad') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('models', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('models', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
