require 'rails_helper'

RSpec.describe AuthenticateController, type: :controller do

    describe 'admin#login_form' do
      it "redirects to admin#index when logged in" do
        @request.session[:logged_in] = true
        get :login_form
        expect(response).to redirect_to(admin_index_path)
      end

      it "displays authenticate#login_form when not logged in" do
        get :login_form
        expect(response).to render_template(:login)
      end
    end
end
