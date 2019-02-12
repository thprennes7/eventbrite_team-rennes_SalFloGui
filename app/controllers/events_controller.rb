class EventsController < ApplicationController
	def index
		@events = Event.all.sort
	end

	def show
		@event = Event.find(params[:id])
		@creator = @event.user
		@participants = @event.users
	end
end
