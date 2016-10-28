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
    if admin_authenticate(login_params[:password])
      admin_login
      redirect_to admin_index_path
    else
      redirect_to login_path
    end
  end

  def logout
    admin_logout
    redirect_to root_path
  end


    private
    def login_params
      params.require(:admin).permit(:password)
    end
end
