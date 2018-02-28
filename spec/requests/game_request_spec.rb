require 'rails_helper'

describe "Games API" do 
  it "gets a particular game" do 
    game = create(:game)

    get "/api/v1/games/#{game.id}"

    game = JSON.parse(response.body)
    expect(game).to have_key("game_id")
    expect(game).to have_key("scores")
  end
end
