module AdminHelper

  def admin_login
    session[:logged_in] = true
  end

  def admin_logged_in?
    false if session[:logged_in].nil?
    session[:logged_in]
  end

  def admin_logout
    session[:logged_in] = false
  end

  def admin_authenticate(password)
    ENV["ADMIN_PASSWORD"] == password
  end

end
