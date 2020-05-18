class EventsController < ApplicationController
  # before_action :logged_in?

  include EventsHelper
  include SessionsHelper

  def index
    @events = Event.all
    @upcoming = Event.upcoming
    @past = Event.past
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      flash.now[:notice] = 'Event was successfully created!'
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event.delete
  end

end
