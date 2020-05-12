class Attendance < ApplicationRecord
	after_create :inscription_send, :admin_send
	belongs_to :user
	belongs_to :event

	def inscription_send(user,event)
		AttendanceMailer.inscription_email(self,event).delivery_now
	end

	def admin_send(event)
		AdminMailer.inscription_email(self).delivery_now
	end
end
