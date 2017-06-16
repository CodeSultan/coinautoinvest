
class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])

      if user.activated?
        log_in user
        if user.tier_level?
          redirect_to dashboard_dashboard_path
        else
          redirect_to root_url
        end
        # params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        # redirect_back_or user
      else
        message  = "Your account is not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
      end

    else
      # Create an error message.
      flash[:danger] = 'Email address or password is incorrect.' # Not quite right!
      render 'new'
    end
  end

  def forget(user)
    user.forget
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
