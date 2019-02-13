class ChargesController < ApplicationController
	before_action :authenticate_user!, only: [:new]

	def new

		@event = Event.find(params[:event_id])
		@attendant = nil
		@attendant = Attendance.find_by(event_id: @event.id, user_id: current_user.id)

	end
end
