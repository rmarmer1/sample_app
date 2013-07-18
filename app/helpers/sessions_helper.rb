module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    
    # creates a 'current_user' that is accessible in both controllers and views...
    # ... and allows constructions such as "<%= current_user.name %>" & "redirect_to current_user"
    self.current_user = user
  end
  
  def signed_in?
      !current_user.nil?
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  # The ||= (“or equals”) assignment operator sets the @current_user instance variable to the user corresponding 
  # to the remember token ... but only if @current_user is undefined!
  
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
    
    # So, this code calls the find_by_remember_token method the first time current_user is called (since current_user is still nil) 
    # but on subsequent invocations returns @current_user without hitting the database!!!!
  end
  
  def sign_out
      self.current_user = nil
      cookies.delete(:remember_token)
  end
end