class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider =&gt; auth['provider'], :uid =&gt; auth['uid'].to_s).first || User.create_with_omniauth(auth)
    reset_session
    session[:user_id] = user.id
    redirect_to root_url
  end
 
  def destroy
    reset_session
    redirect_to root_url, :notice =&gt; 'Signed out!'
  end
 
  def failure
    redirect_to root_url, :alert =&gt; "Authentication error: #{params[:message].humanize}"
  end
end
