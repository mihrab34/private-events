class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit destroy update]
  before_action :require_sign_in, only: %i[index]

  def index
    @upcoming_events = Event.upcoming
    @prev_events = Event.previous
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  def create
    @event = current_user.events.build(events_params)
    if @event.save
      flash[:success] = 'Event successfully created'
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

  def destroy
    @event = current_user.events.find(params[:id])
    if @event.destroy
      flash[:success] = 'Event was successfully deleted.'
      redirect_to user_path(current_user)
    else
      flash[:error] = 'Something went wrong'
      redirect_to events_url
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def events_params
    params.require(:event).permit(:title, :description, :date, :location)
  end
end
