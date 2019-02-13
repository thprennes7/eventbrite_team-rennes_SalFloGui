class ChargesController < ApplicationController
	before_action :authenticate_user!, only: [:new]

	def new
		@event = Event.find(params[:event_id])
	end
end
