require "rails_helper"

feature "users can see the calendar" do
  context "when user visits the home page" do

    let(:competitor1) { Competitor.create( :name => "Kerry J. Lawrence" ) }
    let(:competitor2) { Competitor.create( :name => "Sherita T. Johnson" ) }
    let(:competitor3) { Competitor.create( :name => "Anita K. Robertson" ) }

    let!(:matches){ [
      Match.create( :competitor1_id => competitor1.id, :competitor2_id => competitor2.id, :start_time => 10.days.from_now, :season => 1, :location => "Basketball Court" ),
      Match.create( :competitor1_id => competitor1.id, :competitor2_id => competitor3.id, :start_time => 11.days.from_now, :season => 1, :location => "Basketball Court" ),
      Match.create( :competitor1_id => competitor2.id, :competitor2_id => competitor3.id, :start_time => 12.days.from_now, :season => 1, :location => "Basketball Court" )]
    }
    scenario "the user can see the date data" do
      visit '/calendar'
      expect(page).to have_css '#match_' + matches[2].id.to_s
    end
  end

  context "when user selects month selector" do
    scenario "the user can see months to select in drop down" do
      visit '/calendar'
      expect(page).to have_link('October', href: "/calendar?start_date=October")
    end
  end

  context "when user click on month" do
    scenario "the user can see specific months data when user click on month" do
      visit '/calendar'
      click_link 'October'
      expect(page).to have_content('October')
      # expect(page).not_to have_content('November')
    end
  end
end
