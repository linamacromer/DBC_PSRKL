require 'rails_helper'

RSpec.describe AuthenticateController, type: :controller do
    describe 'admin#login_form' do
      it "redirects to admin#index" do
        get :login
        expect(response).to redirect_to(admin_index_path)
      end

    it "routes GET /admin/login to authenticate#login_form" do
      get :login_form
      expect(response).to render(login_path)
    end
    end
end
