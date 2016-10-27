require 'rails_helper'

RSpec.describe "Routing to admin", :type => :routing do
    it "routes GET /admin to admin#index" do
      expect(:get => "/admin").to route_to("admin#index")
    end
end
