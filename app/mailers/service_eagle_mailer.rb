# frozen_string_literal: true

class ServiceEagleMailer < ApplicationMailer
  def send_confirmation(token)
    @appointment = BookedAppointment.find_by(token: token)
    @service_center = ServiceCenter.find(@appointment.service_center_id)
    @user = User.find(@appointment.user_id)
    mail to: @user.email, subject: 'Appointment detail', from: 'service.eagle12@gmail.com'
  end

  def set_service_count(users)
    @user = users
    mail to: @user.email, subject: 'Appointment detail', from: 'service.eagle12@gmail.com'
  end
end
