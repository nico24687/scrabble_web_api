require 'rails_helper'

describe GetWordsInfoService do 
  it "returns the correct word information for a given word" do 
    word = "foxes"
    words = VCR.use_cassette("services/get_words_info_service") do 
      GetWordsInfoService.new.find_words(word)
    end
  
    expect(words["results"].first["lexicalEntries"].first["inflectionOf"].first).to have_key("text")
  end
end 