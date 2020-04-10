require 'rails_helper'

RSpec.describe "As a user" do
  before(:each) do
    visit '/'
    select("Turing", from: :location)
    click_button('Find Nearest Station')
  end

  it "when I visit the homepage, I can select turing and click on find nearest station" do
    expect(current_path).to eq('/search')

    within '.station' do
      expect(page).to have_content('Name:')
      expect(page).to have_content('Address:')
      expect(page).to have_content('Fuel Type:')
      expect(page).to have_content('Access Times:')

      expect('#name'.text).to_not be_empty
      expect('#address'.text).to_not be_empty
      expect('#fuel-type'.text).to_not be_empty
      expect('#access-times'.text).to_not be_empty

      expect(page).to have_content('Distance:')
      expect(page).to have_content('Travel Time:')
      expect(page).to have_content('Directions:')

      expect('#distance'.text).to_not be_empty
      expect('#travel-time'.text).to_not be_empty
      expect('#directions'.text).to_not be_empty
    end
  end
end
