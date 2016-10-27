require 'rails_helper'

RSpec.describe AdminController, type: :controller do

  describe 'admin#index' do
    it 'loads the dashboard page' do
      expect(get :index).to render :index
    end
  end

  context 'when admin is logged in' do

    # Fake pending test to remind us to return
    xit 'does the routing with the right authentication'
    # When we figure out security we can make this more specific
    before(:each) do
      @request.session[:logged_in] = true
    end

    xit "redirects from /admin/login to admin#index" do
      expect(get :login)
    end
  end

  context 'when admin is not logged in' do
    before(:each) do
      @request.session[:logged_in] = false
    end

    xit "routes GET /admin to admin#login" do
      expect(:get => "/admin").to route_to("admin#login")
    end

    xit "routes GET /admin/login to admin#login" do
      expect(:get => '/admin/login').to route_to("admin#login")
    end

    # When you do admin competitors routes, add the rest here
    xit "routes GET /admin/competitors to admin#login" do
      expect(:get => "/admin/competitors").to route_to("admin#login")
    end

  end
end
