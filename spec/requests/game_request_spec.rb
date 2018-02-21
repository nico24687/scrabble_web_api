require 'rails_helper'

describe "Games API" do 
  it "gets a particular game" do 
    game = create(:game)

    get "/api/v1/games/#{game.id}"

    game = JSON.parse(response.body)
    expect(game).to have_key("id")
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