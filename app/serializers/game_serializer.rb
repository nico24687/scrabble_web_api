class GameSerializer < ActiveModel::Serializer
  attributes  :game_id, :scores 

    # has_many :plays

  def game_id
    object.id
  end

  # def scores
  #   [
  #     {user_id: object.plays.first.user_id , score: object.plays.first.score}
  #   ]
  # end

  def scores 
    object.plays
  end


 
end
