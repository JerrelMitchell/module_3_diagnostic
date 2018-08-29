require 'rails_helper'

feature "User can visit root page" do
  scenario "and view navbar contents" do
    visit "/"
    within(".navbar") do
      expect(page).to have_content("AltFuelFinder")
      expect(page).to have_selector("input[value='Search by zip...']")
    end
  end
  scenario 'and search for stations close to zip code' do
    # When I visit "/
    visit '/'
    # And I fill in the search form with 80203 (Note: Use the existing search form)
    fill_in 'q', with: '80203'
# And I click "Locate"
    click_on 'Locate'
# Then I should be on page "/search"
    expect(current_path).to eq('/search')
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    expect(page).to have_css('.station', count: 10)
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    expect(page).to have_css('.name')
    expect(page).to have_css('.address')
    expect(page).to have_css('.fuel_types')
    expect(page).to have_css('.distance')
    expect(page).to have_css('.access_times')

  end
end
