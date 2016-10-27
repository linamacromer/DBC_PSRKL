require 'rails_helper'

RSpec.feature "Admin adds new competitor", type: :feature do
  scenario "Admin adds new competitor" do
    visit new_competitor_path

    fill_in "Name", :with => "John Doe"
    click_button "Submit"

    expect(page).to have_text("Welcome")
  end
end
