require 'rails_helper'

RSpec.feature "Standings", type: :feature do
  scenario "User visits standing page" do
    visit "/standings"

    expect(page).to have_text("Standings")
  end
end
