require 'rails_helper'

describe Word do 
  it "has valid attributes" do 
    word = Word.new(root: "fox", original: "foxes")

    expect(word.root).to eq("fox")
    expect(word.original).to eq("foxes")
  end
end