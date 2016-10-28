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
        context 'incorrect password' do
        	before(:each) do
        		post :login, {password: "passworf"}
        	end

        	it 'does not log in' do
        		expect(@request.session[:logged_in]).to be_falsey
        	end

        	it 'redirects to the login page' do
        		expect(response).to redirect_to login_path
        	end
        end
        
        context 'correct password' do
        	before(:each) do
        		post :login, {password: ENV["ADMIN_PASSWORD"]}
        	end
        	 it 'logs in' do
        		expect(@request.session[:logged_in]).to be true
        	end

        	it 'redirects to the index page' do
        		expect(response).to redirect_to admin_index_path
        	end
        end
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
