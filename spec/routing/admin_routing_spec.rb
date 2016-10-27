require 'rails_helper'

RSpec.describe "Routing to admin", :type => :routing do
  context 'when admin is logged in' do

    # Fake pending test to remind us to return
    it 'does the routing with the right authentication'
    # When we figure out security we can make this more specific
    before(:each) do
      @request.session[:logged_in] = true
    end

    it "routes GET /admin to admin#index" do
      expect(:get => "/admin").to route_to("admin#index")
    end

    # When you do admin competitors routes, add the rest here
    it "routes GET /admin/competitors to competitors#index" do
      expect(:get => "/admin/competitors").to route_to("competitors#index")
    end

  end

  context 'when admin is not logged in' do
    before(:each) do
      @request.session[:logged_in] = false
    end

    it "routes GET /admin to admin#login" do
      expect(:get => "/admin").to route_to("admin#login")
    end

    # When you do admin competitors routes, add the rest here
    it "routes GET /admin/competitors to admin#login" do
      expect(:get => "/admin/competitors").to route_to("admin#login")
    end

  end
end
