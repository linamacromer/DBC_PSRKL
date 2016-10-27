require 'rails_helper'

RSpec.describe "standings/index.html.erb", type: :view do
  it "Displays a list of standings" do
    assign(:standings, [
      build(:competitor)
    ])

    render

    expect(rendered).to have_selector('table.standings')
    expect(rendered).to match /John/
  end
end
