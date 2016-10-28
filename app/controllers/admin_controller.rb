class AdminController < ApplicationController
  include AdminHelper

  before_action :admin_authenticate

  def admin_authenticate
    unless admin_logged_in?
      redirect_to login_path
    end
  end

  def index
    render :index
  end

end
