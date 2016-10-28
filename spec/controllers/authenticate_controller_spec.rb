require 'rails_helper'

RSpec.describe AuthenticateController, type: :controller do

    describe 'authenticate#login_form' do
      it "redirects to authenticate#index when logged in" do
        @request.session[:logged_in] = true
        get :login_form
        expect(response).to redirect_to(admin_index_path)
      end

      it "displays authenticate#login_form when not logged in" do
        get :login_form
        expect(response).to render_template(:login)
      end
    end

    describe 'authenticate#login' do
    end

    describe 'authenticate#logout' do
      before(:each) do
        @request.session[:logged_in] = true
        get :logout
      end

      it 'redirects to main site index' do
        expect(response).to redirect_to(root_path)
      end

      it 'removes logged_in session variable' do
        expect(@request.session[:logged_in]).to be_falsey
      end
    end

end
