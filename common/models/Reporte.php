<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "reporte".
 *
 * @property string $id
 * @property integer $Plantilla_id
 *
 * @property Peticion[] $peticions
 * @property Plantilla $plantilla
 */
class Reporte extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'reporte';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Plantilla_id'], 'required'],
            [['Plantilla_id'], 'integer']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('models', 'ID'),
            'Plantilla_id' => Yii::t('models', 'Plantilla ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPeticions()
    {
        return $this->hasMany(Peticion::className(), ['Reporte_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPlantilla()
    {
        return $this->hasOne(Plantilla::className(), ['id' => 'Plantilla_id']);
    }

    /**
     * @inheritdoc
     * @return \common\models\query\ReporteQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \common\models\query\ReporteQuery(get_called_class());
    }
}
