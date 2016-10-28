class AuthenticateController < ApplicationController
  include AdminHelper

  # Get request
  def login_form
    render :login
  end

  # Post request
  def login
  end

  def logout
  end
end
