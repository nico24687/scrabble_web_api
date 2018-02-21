class GameSerializer < ActiveModel::Serializer
  attributes  :game_id, :scores 

  # has_many :plays

  def game_id
    object.id
  end

  # def scores
  #   [object.attributes.merge(score: 15)]
  # end

  def scores 
    object.attributes
  end

end
