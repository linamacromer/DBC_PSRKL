require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the AdminHelper. For example:
#
# describe AdminHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe AdminHelper, type: :helper do
  describe "login" do
    before(:each) do
      expect(session[:logged_in]).to eq nil
      helper.login
    end

    it "logs the administrator in" do
      expect(session[:logged_in]).to eq true
    end

    it "makes logged_in? return true" do
      expect(helper.logged_in?).to eq true
    end
  end

  describe "logout" do
    it "logs the administrator out" do
      session[:logged_in] = true
      helper.logout
      expect(session[:logged_in]).to eq false
    end
  end

  describe "authenticate" do
    it 'authenticates if password is valid' do
      expect(authenticate(ENV["ADMIN_PASSWORD"])).to eq(true)
    end

    it 'fails to authenticate if password is invalid' do
      expect(authenticate("passworf")).to eq(false)
    end
  end
end
