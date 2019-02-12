class EventsController < ApplicationController
	def index
		@events = Event.all.sort
	end
end
