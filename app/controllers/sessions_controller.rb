class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(name: params[:name])
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:danger] = 'Enter the right name'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
