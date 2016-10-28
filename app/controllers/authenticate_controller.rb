class AuthenticateController < ApplicationController
  include AdminHelper

  # Get request
  def login_form
    unless admin_logged_in?
      render :login
    else
      redirect_to admin_index_path
    end
  end

  # Post request
  def login
    admin_login
    redirect_to admin_index_path
  end

  def logout
    admin_logout
    redirect_to root_path
  end
end
