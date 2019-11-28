class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if session[:last_url]
        redirect_to session[:last_url]
        session.delete(:last_url)
      else
        redirect_to root_path
      end

    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to login_path
  end
end
