class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @created_events = current_user.events
    @upcoming_events = current_user.attended_events.upcoming
    @prev_events = current_user.attended_events.previous
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User successfully created'
      redirect_to login_path
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def update
    @user = User.find(user_params)
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to @user
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name)
  end
end
