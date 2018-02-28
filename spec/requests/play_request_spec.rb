require 'rails_helper'

describe "plays API" do 
  it "can create a play" do 
    game = create(:game)
    play_params = {user_id: game.player_1.id, word: "at"}
    post "/api/v1/games/#{game.id}/plays", params: {play: play_params}

    play = Play.last 
    expect(response).to have_http_status(201)
    expect(play.user_id).to eq(game.player_1.id)
    expect(play.word).to eq("at")
  end
end


