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
    visit '/'
    fill_in 'q', with: '80203'
    click_on 'Locate'
    expect(current_path).to eq('/search')
    expect(page).to have_css('.station', count: 10)
    expect(page).to have_css('.name', count: 10)
    expect(page).to have_css('.address', count: 10)
    expect(page).to have_css('.fuel_types', count: 10)
    expect(page).to have_css('.distance', count: 10)
    expect(page).to have_css('.access_times', count: 10)
    # And the stations should be limited to Electric and Propane
    # within first('.fuel_types') do
    #   expect(:fuel_type_code).to eq('ELEC').or eq('LPG')
    # end
  end
end
