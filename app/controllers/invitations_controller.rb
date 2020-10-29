class InvitationsController < ApplicationController
  include UsersHelper
  def create
    @event = Event.find(params[:id])
    @attended_event = @event.invitations.create(attendee: current_user)
    if @attended_event.save
      redirect_to events_path, notice: 'Thanks for Attending'
    else
      redirect_to events_path, alert: 'You can only attend once'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    current_user.attended_events.destroy(@event)
    flash[:notice] = 'Invitation was successfully destroyed.'
    redirect_to user_path(current_user)
  end
end
