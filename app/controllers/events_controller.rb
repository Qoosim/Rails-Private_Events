class EventsController < ApplicationController
  # before_action :logged_in?

  include EventsHelper
  include SessionsHelper

  def index
    @events = Event.all
    @past = Event.past
    @upcoming = Event.upcoming
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      flash.now[:notice] = 'Event was created successfully!'
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def planned_event
    user = current_user
    @event = Event.find(params[:id])
    @event.attendees << user
    redirect_to user
  end

  def cancelled_event
    user = current_user
    @event = Event.find(params[:id])
    @event.attendees.delete(user)
    redirect_to user
  end

  def destroy
    @event.delete
  end

  private

  def event_params
    params.require(:event).permit(
      :title,
      :description,
      :date,
      :location
    )
  end
end
