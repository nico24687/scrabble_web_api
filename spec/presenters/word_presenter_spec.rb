require 'rails_helper'

describe WordPresenter do 
  it "converts the json from the service to the word PORO" do 
    user_input = "foxes"

    word = VCR.use_cassette("services/get_words_info_service") do 
      WordPresenter.new(user_input).word
    end

    expect(word.root).to eq("fox")
    expect(word.original).to eq("foxes")
  end
  context "when the word is invalid" do
    it "returns an invalid word" do 
      word = VCR.use_cassette("services/get_words_info_service_error") do 
        WordPresenter.new("foxez").word
      end

    expect(word.original).to eq("foxez")
    expect(word).not_to be_valid

    end
  end
end