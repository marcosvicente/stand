class EventsController < ApplicationController
  def index
    @event = Event.all

    render :json => @event, :status => :ok
  end
end
