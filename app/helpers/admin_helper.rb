module AdminHelper

  def login()
    session[:logged_in] = true
  end

  def logged_in?
    false if session[:logged_in].nil?
    session[:logged_in]
  end

  def logout
    session[:logged_in] = false
  end
end
