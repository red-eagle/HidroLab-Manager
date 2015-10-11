<?php

namespace common\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\CostoPredeterminados;

/**
 * CostoPredeterminadosSearch represents the model behind the search form about `common\models\CostoPredeterminados`.
 */
class CostoPredeterminadosSearch extends CostoPredeterminados
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'vencimiento'], 'integer'],
            [['nombre', 'fechaIngreso', 'modena', 'tipo'], 'safe'],
            [['costo'], 'number'],
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
        $query = CostoPredeterminados::find();

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
            'id' => $this->id,
            'costo' => $this->costo,
            'fechaIngreso' => $this->fechaIngreso,
            'vencimiento' => $this->vencimiento,
        ]);

        $query->andFilterWhere(['like', 'nombre', $this->nombre])
            ->andFilterWhere(['like', 'modena', $this->modena])
            ->andFilterWhere(['like', 'tipo', $this->tipo]);

        return $dataProvider;
    }
}
