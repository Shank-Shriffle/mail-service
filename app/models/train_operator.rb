class TrainOperator < Account
  has_many :trains, foreign_key: :operator_id, dependent: :destroy
end