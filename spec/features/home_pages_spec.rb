require 'rails_helper'

RSpec.feature "HomePages", type: :feature do
  scenario "User visits homepage" do
    visit "/"

    # fill_in "Name", :with => "My Widget"
    # click_button "Create Widget"

    expect(page).to have_text("PSRKL")
  end
end
