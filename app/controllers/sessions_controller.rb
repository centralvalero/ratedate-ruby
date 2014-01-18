class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
    redirect_to '/'
  end
 
  def destroy
    reset_session
    redirect_to root_url, :notice =&gt; 'Signed out!'
  end
 
  def failure
    redirect_to root_url, :alert =&gt; "Authentication error: #{params[:message].humanize}"
  end
  protected

	  def auth_hash
	    request.env['omniauth.auth']
	  end
end
