<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\search\GeneralHasTipoSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="general-has-tipo-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'General_id') ?>

    <?= $form->field($model, 'Tipo_id') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('models', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('models', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
