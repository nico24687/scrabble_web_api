require 'rails_helper'

describe "plays API" do 
  it "can create a play" do 
    VCR.use_cassette("services/get_words_info_service") do 
      game = create(:game)
      play_params = {user_id: game.player_1.id, word: "foxes"}
      post "/api/v1/games/#{game.id}/plays", params: {play: play_params}

      play = Play.last 
      expect(response).to have_http_status(201)
      expect(play.user_id).to eq(game.player_1.id)
      expect(play.word).to eq("foxes")
    end 
  end
  context "when the word is invalid" do 
    it "gives an error message" do 

      VCR.use_cassette("services/get_words_info_service_error") do 
        game = create(:game)
        play_params = {user_id: game.player_1.id, word: "foxez"}
        
        post "/api/v1/games/#{game.id}/plays", params: {play: play_params}

        play = Play.last
        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)["message"]).to eq("foxez is not a valid word.")
      end 

    end
  end
end


