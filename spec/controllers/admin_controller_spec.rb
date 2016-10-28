require 'rails_helper'

RSpec.describe AdminController, type: :controller do


  context 'when admin is logged in' do
    # When we figure out security we can make this more specific
    before(:each) do
      @request.session[:logged_in] = true
    end

    describe 'admin#login_form' do
      it "redirects to admin#index" do
        get :login
        expect(response).to redirect_to(admin_index_path)
      end
    end

    describe 'admin#index' do
      it 'loads the dashboard page' do
        expect(get :index).to render_template :index
      end
    end
  end

  context 'when admin is not logged in' do
    before(:each) do
      @request.session[:logged_in] = false
    end

    it "routes GET /admin to admin#login_form" do
      expect(:get => "/admin").to route_to("admin#login_form")
    end

    it "routes GET /admin/login to admin#login_form" do
      expect(:get => '/admin/login').to route_to("admin#login_form")
    end

    it "routes GET /admin/competitors to admin#login_form" do
      expect(:get => "/admin/competitors").to route_to("admin#login_form")
    end

    it "routes GET /admin/matches to admin#login_form" do
      expect(:get => "/admin/matches").to route_to("admin#login_form")
    end
  end
end
