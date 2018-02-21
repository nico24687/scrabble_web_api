require 'rails_helper'

describe WordPresenter do 
  it "converts the json from the service to the word PORO" do 
    word = "foxes"
    words = WordPresenter.new(word).words

    expect(words.first.root).to eq("fox")
  end
end