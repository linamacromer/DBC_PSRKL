require 'rails_helper'

RSpec.describe MatchesController, type: :controller do

  before(:each) do
    @request.session[:logged_in] = true
  end
  
  describe 'matches#index' do
    it 'when admin logged in the admin matches page loads' do
      expect(get :index).to render_template :index
    end
  end
end
