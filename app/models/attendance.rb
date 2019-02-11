class Attendance < ApplicationRecord
	belongs_to :user
	belongs_to :event

	after_create :new_attendance_send

  def new_attendance_send
    AttendanceMailer.new_attendance_email(self).deliver_now
		AttendanceMailer.new_attendance_creator_email(self).deliver_now
  end
end
