class EventsController < ApplicationController

	def index
		@events = Event.all.sort
	end

	def show
		@event = Event.find(params[:id])
		@creator = @event.user
		@participants = @event.users
	end

	def create


		@event = Event.new(title: params[:title], description: params[:description], start_date: convert_date(params[:event]), duration: params[:duration], location: params[:location], price: params[:price], user_id: current_user.id)
		puts params[:start_date]
		puts @event.user
		puts @event.title
		puts @event.description
		puts @event.start_date
		puts @event.duration
		puts @event.location
		puts @event.price

		if @event.save
			redirect_to root_path
		else
			render :new
		end
	end

	def event_params
		params.permit(:title, :description, :start_date, :duration, :location)
	end
end
