class AuthenticateController < ApplicationController
  include AdminHelper

  # Get request
  def login_form
    unless logged_in?
      render :login
    else
      redirect_to admin_index_path
    end
  end

  # Post request
  def login
    login
    redirect_to admin_index_path
  end

  def logout
    logout
    redirect_to root_path
  end
end
