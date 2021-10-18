class EventsController < ApplicationController
  def index
    aux_hour = Time.new
    aux_hour = aux_hour.change(hour: 9)
    @event = Array.new
    track = Array.new

    Event.all.collect do |event|
      if (aux_hour.hour == 12) 
        # add lunch
        lunch  = Event.new
        lunch.hour = aux_hour.hour
        lunch.name = "Almoço"
        lunch.time = 60
        
        track << lunch

        aux_hour = aux_hour.change({hour: 13})

        event.hour = aux_hour
        track << event
        aux_hour = aux_hour.change(hour: aux_hour.hour, min: event.time)
      elsif (aux_hour.hour == 17 || aux_hour.hour == 16)
        hapy_hour  = Event.new
        hapy_hour.hour = aux_hour
        hapy_hour.name = "Evento Network"
        hapy_hour.time = 60
        track << hapy_hour

        @event.push(track)
        track = []

        aux_hour = aux_hour.change({hour: 9})
        event.hour = aux_hour
        track << event
        aux_hour += (event.time * 60)
      else
        event.hour = aux_hour
        aux_hour += (event.time * 60)
        track << event
      end
    end


    render :json => @event, :status => :ok
  end
end
