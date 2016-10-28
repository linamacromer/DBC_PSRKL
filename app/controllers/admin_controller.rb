class AdminController < ApplicationController
  include AdminHelper
  before_action :admin_authenticate
  skip_before_action :admin_authenticate, only: :login

  def admin_authenticate
    unless logged_in?
      redirect_to login_path
    end
  end

  def index
    render :index
  end

  # Get request
  def login_form
    render :login
  end

  # Post request
  def login
  end

end
