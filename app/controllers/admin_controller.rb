class AdminController < ApplicationController
  include AdminHelper

  before_action :admin_authenticate

  def admin_authenticate
    unless logged_in?
      redirect login_path
    end
  end

  def index
    render :index
  end

  def login
  end

end
