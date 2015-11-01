<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\RamaHasGeneral;

/**
 * RamaHasGeneralSearch represents the model behind the search form about `common\models\RamaHasGeneral`.
 */
class RamaHasGeneralSearch extends RamaHasGeneral
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Rama_id', 'General_id'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = RamaHasGeneral::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'Rama_id' => $this->Rama_id,
            'General_id' => $this->General_id,
        ]);

        return $dataProvider;
    }
}
