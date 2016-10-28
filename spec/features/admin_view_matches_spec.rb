require "rails_helper"

feature "admin can see the matches" do
  context "when admin visit matches page" do

    before(:each) do
      visit login_path
      fill_in "Password", :with => ENV["ADMIN_PASSWORD"]
      click_button "Submit"
    end

    let(:competitor1) { Competitor.create( :name => "Kerry J. Lawrence" ) }
    let(:competitor2) { Competitor.create( :name => "Sherita T. Johnson" ) }
    let(:competitor3) { Competitor.create( :name => "Anita K. Robertson" ) }

    let!(:matches){ [
      Match.create( :competitor1_id => competitor1.id, :competitor2_id => competitor2.id, :start_time => 1.days.ago, :season => 1, :location => "Basketball Court" ),
      Match.create( :competitor1_id => competitor1.id, :competitor2_id => competitor3.id, :start_time => 2.days.ago, :season => 1, :location => "Basketball Court" ),
      Match.create( :competitor1_id => competitor2.id, :competitor2_id => competitor3.id, :start_time => 3.days.ago, :season => 1, :location => "Basketball Court" )]
    }
    scenario "the admin can see the edit button" do
      visit '/admin/matches'
      expect(page).to have_button("Edit")
    end

    scenario "the admin can see the add new match button" do
      visit '/admin/matches'
      expect(page).to have_button("Add New Match")
    end

    scenario "the admin can see a table" do
      visit '/admin/matches'
      find_table = page.find('#match-calendar').has_css?(".table")
      expect(find_table).to eq(true)
    end
  end

  context "when admin click on edit button" do
    xscenario "the page will redirect to edit page" do
      visit '/admin/matches'
      click_button 'Edit'
      expect(current_path).to eql(edit_match_path)
    end
  end

  context "when admin click on add new match button" do
    xscenario "the page will redirect to new match page" do
      visit '/admin/matches'
      click_button 'Add New Match'
      expect(current_path).to eql(new_match_path)
    end
  end
end
