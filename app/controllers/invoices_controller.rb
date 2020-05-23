# frozen_string_literal: true

class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :new_invoice, :find_appointment, :check_service_type, :find_sparepart, only: %i[generate_invoice]
  # before_action :find_sparepart, :find_appointments, only: %i[show]

  def generate_invoice
    flash.alert = if @invoice.save
                    'invoice is generated'
                  else
                    'invoice can not be created'
                  end
    redirect_to service_center_admin_pending_appointments_path
  end

  def show
    @invoice = Invoice.find_by(booked_appointment_id: params[:id])
    @partial_total = @invoice.total - @invoice.service_charge 
    @used_spareparts = UsedSparepart.joins(:sparepart).select(:id, :quantity, :total, 'spareparts.sparepart_name', 'spareparts.price').where('booked_appointment_id = ?', params[:id])
    @appointment = BookedAppointment.joins(:user).select(:id, :token, :vehicle_name, :service, :service_date, :service_center_id, 'users.username', 'users.email', 'users.contact').find(params[:id])
    @service_center = ServiceCenter.find(@appointment.service_center_id)
  end

  def new_invoice
    @update = ServiceUpdate.find(params[:service_update_id])
    @invoice = Invoice.new
  end

  def check_service_type
    @invoice.service_charge = 350 if @appointment.service == 'paid'
  end

  def find_sparepart
    @invoices = UsedSparepart.joins(:sparepart).select(:id, :quantity, :total, 'spareparts.sparepart_name', 'spareparts.price').where('booked_appointment_id = ?', @invoice.booked_appointment_id)
    @invoices.each do |item|
      @invoice.total += item.total
    end
    @partial_total = @invoice.total
    @invoice.total = @invoice.total + @invoice.service_charge
  end

  def find_appointment
    @appointment = BookedAppointment.joins(:user).select(:id, :service_center_id, :token, :vehicle_name, :service_date, :service, 'users.username', 'users.email', 'users.contact').find(@update.booked_appointment_id)
    @invoice.booked_appointment_id = @appointment.id
  end

  def find_appointments
    @appointment = BookedAppointment.joins(:user).select(:id, :service_center_id, :token, :vehicle_name, :service_date, :service, 'users.username', 'users.email', 'users.contact').find(@invoice.booked_appointment_id)
    @service_center = ServiceCenter.find(@appointment.service_center_id)
  end
end
