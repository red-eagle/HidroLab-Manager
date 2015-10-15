<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\search\DecretoHasTipoSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('models', 'Decreto Has Tipos');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="decreto-has-tipo-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('models', 'Create Decreto Has Tipo'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'decreto.nombre',
            'tipo.nombre',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
