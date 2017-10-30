class SessionsController < ApplicationController
  def new
  end

  def login
    @user = User.find_by(params[:session][:email])
    if @user && @user.authentificate(params[:session][password])
      log_in @user
      rdirect_to controller: :user, action: :edit
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end
