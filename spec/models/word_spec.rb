require 'rails_helper'

describe Word do 
  it "has valid attributes" do 
    word = Word.new(root: "random root")

    expect(word.root).to eq("random root")
  end
end