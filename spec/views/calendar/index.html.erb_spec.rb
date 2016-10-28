require "rails_helper"

describe "users can see the calendar" do
  let(:competitor1) { Competitor.create( :name => "Kerry J. Lawrence" ) }
  let(:competitor2) { Competitor.create( :name => "Sherita T. Johnson" ) }
  let(:competitor3) { Competitor.create( :name => "Anita K. Robertson" ) }

  let!(:matches){ [
    Match.create( :competitor1_id => competitor1.id, :competitor2_id => competitor2.id, :start_time => 10.days.from_now, :season => 1, :location => "Basketball Court" ),
    Match.create( :competitor1_id => competitor1.id, :competitor2_id => competitor3.id, :start_time => 11.days.from_now, :season => 1, :location => "Basketball Court" ),
    Match.create( :competitor1_id => competitor2.id, :competitor2_id => competitor3.id, :start_time => 12.days.from_now, :season => 1, :location => "Basketball Court" ),
  ]}

  it "displays date header" do
    @matches = matches
    render :template => "calendar/index.html.erb"
    rendered.should match(/Date/)
  end

  it "displays competitor 1 header" do
    @matches = matches
    render :template => "calendar/index.html.erb"
    rendered.should match(/Competitor 1 Name/)
  end

  it "displays competitor 2 header" do
    @matches = matches
    render :template => "calendar/index.html.erb"
    rendered.should match(/Competitor 2 Name/)
  end

  it "displays location header" do
    @matches = matches
    render :template => "calendar/index.html.erb"
    rendered.should match(/Location/)
  end
end
