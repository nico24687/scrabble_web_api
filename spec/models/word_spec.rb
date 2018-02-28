require 'rails_helper'

describe Word do 
  it "has valid attributes" do 
    word = Word.new(root: "fox", original: "foxes")

    expect(word.root).to eq("fox")
    expect(word.original).to eq("foxes")
    expect(word).to be_valid
  end
  context "when the root is missing" do 
    it "is an invalid word" do 
      word = Word.new(original: "foxez")

      expect(word).not_to be_valid
    end
  end
end