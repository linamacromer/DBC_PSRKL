require 'rails_helper'

RSpec.describe AdminController, type: :controller do


  context 'when admin is logged in' do
    # When we figure out security we can make this more specific
    before(:each) do
      @request.session[:logged_in] = true
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
      get :index
      expect(response).to redirect_to(login_path)
    end

# This will go into matches
    xit "routes GET /admin/matches to authenticate#login_form" do
      expect(response).to redirect_to(login_path)
    end
  end
end
