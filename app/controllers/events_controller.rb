class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit destroy update]
  before_action :require_sign_in, only: %i[index]

  def index; end

  def new
    @event = Event.new
    @user = User.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.events.build(events_params)
    if @event.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @event = current_user.events.find(params[:id])
    @event.update(events_params)

    redirect_to @event
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def events_params
    param.require(:event).permit(:title, :description, :date, :location)
  end
end