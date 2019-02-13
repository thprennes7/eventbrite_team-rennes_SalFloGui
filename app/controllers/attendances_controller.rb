class AttendancesController < ApplicationController
	def create
		a = Attendance.new(event_id: params[:event_id], user_id: current_user.id, stripe_customer_id: params[:stripeToken])
		puts params
		if a.save
			redirect_to event_path(params[:event_id])
		else
			render :new
		end
	end
	def index
		@attendances = Attendance.where("event_id = #{params[:event_id]}")
		@event = Event.find(params[:event_id])
	end
end
