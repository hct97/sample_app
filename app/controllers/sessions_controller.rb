class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if user&.authenticate params[:session][:password]
      if user.activated?
        login_remember user
      else
        flash[:warning] = t "mail.active.not_active"
        redirect_to root_url
      end
    else
      flash.now[:danger] = t ".invalid"
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = t ".logout"
    redirect_to root_url
  end

  def login_remember user
    log_in user
    if params[:session][:remember_me] == Settings.session.params
      remember user
    else
      forget user
    end
    redirect_back_or user
    flash[:success] = t ".success"
  end
end
