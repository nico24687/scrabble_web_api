require 'rails_helper'

describe GetWordsInfoService do 
  it "returns the correct word information for a given word" do 
    word = "foxes"
    words = GetWordsInfoService.new.find_words(word)

    
  end
end 