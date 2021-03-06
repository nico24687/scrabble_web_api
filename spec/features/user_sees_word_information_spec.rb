require 'rails_helper'

describe "user searches a word in the search box" do 
  it "if word is valid it sees the root form of the word is" do 
    visit "/"
    fill_in "q", with: "foxes"
    VCR.use_cassette("services/get_words_info_service") do 
      click_on "Validate Word"
    end

    expect(current_path).to eq(search_path)
    expect(page).to have_css(".valid")
    expect(page).to have_css(".root")
    expect(page).to have_content("Its root form is fox")
  end
  it "if word is invalid it sees a warning message saying the word in not a valid word" do 
    visit "/"
    fill_in "q", with: "foxez"
    
    VCR.use_cassette("services/get_words_info_service_error") do 
      click_on "Validate Word"
    end

    expect(current_path).to eq(search_path)
    expect(page).to have_content("That is not a valid word")
  end
end 



# Feature:
# As a user
# When I visit "/"
# And I fill in a text box with "foxes"
# And I click "Validate Word"
# Then I should see a message that says "'foxes' is a valid word and its root form is 'fox'."