require 'rails_helper'

describe "Games API" do 
  it "gets a particular game" do 
    game = create(:game)

    get "/api/v1/games/#{game.id}"

    game = JSON.parse(response.body)
    expect(game).to have_key("game_id")
    expect(game).to have_key("scores")
  end

  xit "can create a new game" do 
    game_params = {player_1_id: 1, player_2_id: 2}
    post "/api/v1/games", params: {game: game_params}

    game = Game.last 

    expect(response).to have_http_status_code(201)

    get "/ap/v1/games/1"
    expect(game).to have_key("game_id")
  end
end


#  create_table "games", force: :cascade do |t|
#     t.bigint "player_1_id"
#     t.bigint "player_2_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["player_1_id"], name: "index_games_on_player_1_id"
#     t.index ["player_2_id"], name: "index_games_on_player_2_id"
#   end