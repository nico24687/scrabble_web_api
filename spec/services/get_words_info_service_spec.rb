require 'rails_helper'

describe GetWordsInfoService do 
  it "returns the correct word information for a given word" do 
    word = VCR.use_cassette("services/get_words_info_service") do 
      GetWordsInfoService.new.find_words("foxes")
    end
  
    expect(word["results"].first["lexicalEntries"].first["inflectionOf"].first).to have_key("text")
  end
  context "when the word does not exist" do 
    it "returns an error response" do 
      word = VCR.use_cassette("services/get_words_info_service_error") do 
        GetWordsInfoService.new.find_words("foxez")
      end

      expect(word["error"]).to eq("word not found")
    end
  end
end 