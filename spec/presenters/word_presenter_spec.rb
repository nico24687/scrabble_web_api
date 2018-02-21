require 'rails_helper'

describe WordPresenter do 
  it "converts the json from the service to the word PORO" do 
    word = "foxes"

    words = VCR.use_cassette("services/get_words_info_service") do 
      WordPresenter.new(word).words
    end

    expect(words.first.root).to eq("fox")
  end
end