require "rails_helper"

describe "admin can see the matches" do
  let(:competitor1) { Competitor.create( :name => "Kerry J. Lawrence" ) }
  let(:competitor2) { Competitor.create( :name => "Sherita T. Johnson" ) }
  let(:competitor3) { Competitor.create( :name => "Anita K. Robertson" ) }

  let!(:matches){ [
    Match.create( :competitor1_id => competitor1.id, :competitor2_id => competitor2.id, :start_time => 10.days.from_now, :season => 1, :location => "Basketball Court" ),
    Match.create( :competitor1_id => competitor1.id, :competitor2_id => competitor3.id, :start_time => 11.days.from_now, :season => 1, :location => "Basketball Court" ),
    Match.create( :competitor1_id => competitor2.id, :competitor2_id => competitor3.id, :start_time => 12.days.from_now, :season => 1, :location => "Basketball Court" )]
  }

  before(:each) do
    @matches = matches
    render :template => "matches/index.html.erb"
  end

  it "displays date header" do
    rendered.should match(/Date/)
  end

  it "displays competitor 1 header" do
    rendered.should match(/Competitor 1 Name/)
  end

  it "displays competitor 2 header" do
    rendered.should match(/Competitor 2 Name/)
  end

  it "displays location header" do
    rendered.should match(/Location/)
  end

  it "displays the edit button" do
    rendered.should match(/Edit/)
  end
  it "displays the add new button" do
    rendered.should match(/Add New Match/)
  end

  it "displays the table" do
    rendered.should match(/table/)
  end

  it "displays the weather" do
    rendered.should match(/calendar-weather/)
  end
end
