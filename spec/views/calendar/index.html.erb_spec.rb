require "rails_helper"

describe "users can see the calendar" do
  it "displays date header" do
    render
    rendered.should contain("Date")
  end

  it "displays competitor 1 header" do
    render
    rendered.should contain("Competitor 1 Name")
  end

  it "displays competitor 2 header" do
    render
    rendered.should contain("Competitor 2 Name")
  end

  it "displays location header" do
    render
    rendered.should contain("Location")
  end
end
