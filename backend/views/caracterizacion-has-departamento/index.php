<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\bootstrap\Modal;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel common\models\search\CaracterizacionHasDepartamentoSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('models', 'Caracterizacion Has Departamentos');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="caracterizacion-has-departamento-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::button(Yii::t('models', 'Create Caracterizacion Has Departamento'), ['value'=>Url::to('caracterizacion-has-departamento/create'),
        'class' => 'btn btn-success','id'=>'modalButton']) ?>
    </p>

    <?php
        Modal::begin([
                'header'=>'<h4>Caracterizacion has Departamento</h4>',
                'id'=>'modal',
                'size'=>'modal-lg',
            ]);
        echo "<div id='modalContent'></div>";
        Modal::end();
    ?>

    <?php Pjax::begin();?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'Caracterizacion_id',
            'Departamento_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
    <?php Pjax::end();?>
</div>
