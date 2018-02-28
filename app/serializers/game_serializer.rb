class GameSerializer < ActiveModel::Serializer
  attribute :id, key: :game_id

  has_many :plays, key: :scores
 
end
