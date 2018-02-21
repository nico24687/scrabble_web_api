require 'rails_helper'

describe "user searches a real word in the seaerch box" do 
  it "sees that the word is valid and what the root form of the word is" do 
    visit "/"
    fill_in "q", with: "foxes"
    click_on "Validate Word"

    expect(current_path).to eq(search_path)
    # expect(page).to have_css(".valid")
    expect(page).to have_css(".root")
    expect(page).to have_content("Its root form is fox")
  end
end 



# Feature:
# As a user
# When I visit "/"
# And I fill in a text box with "foxes"
# And I click "Validate Word"
# Then I should see a message that says "'foxes' is a valid word and its root form is 'fox'."