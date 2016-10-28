require 'rails_helper'

RSpec.describe CompetitorsController, type: :controller do

  before(:each) do
    @request.session[:logged_in] = true
  end

  describe "GET #index" do
    it "returns index success if logged in" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "redirects authenticate#login_form if not logged in" do
      @request.session[:logged_in] = false
      get :index
      expect(response).to redirect_to(login_path)
    end
  end

  describe "GET #new" do
    it "returns new success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do

    context "when valid params are passed" do
      it "responds with status code 302" do
        post(:create, { competitors: { name: "John Doe" }})
        expect(response).to have_http_status(302)
      end

      it "redirects to the admin dashboard" do
        post(:create, { competitors: { name: "John Doe" }})
        expect(response).to redirect_to(admin_index_path)
      end
    end

    context "when invalid params are passed" do
      it "responds with status code 200" do
        post(:create, { competitors: {title: "John Doe"}})
        expect(response).to have_http_status 200
      end

      it "redirects to the new competitor page" do
        post(:create, { competitors: {title: "John Doe"}})
        expect(response).to render_template("new")
      end
    end

  end

end
