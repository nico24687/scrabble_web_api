require 'rails_helper'

describe "Games API" do 
  it "gets a particular game" do 
    game = create(:game)

    get "/api/v1/games/#{game.id}"

    game = JSON.parse(response.body)
    expect(game).to have_key("game_id")
    expect(game).to have_key("scores")
  end

  it "can create a new game" do 
    game_params = {user_id: 1, word: "at"}
    post "/api/v1/games/1/plays", params: {game: game_params}

    game = Game.last 

    expect(response).to have_http_status_code(201)

    get "/ap/v1/games/1"
    expect(game).to have_key("game_id")
    expect(game).to have_key("scores")
  end
end
