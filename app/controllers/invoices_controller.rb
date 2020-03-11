# frozen_string_literal: true

class InvoicesController < ApplicationController
  def generate_invoice
    @invoices = UsedSparepart.joins(:sparepart).select(:id, :quantity, :total, 'spareparts.sparepart_name', 'spareparts.price').where('booked_appointment_id = ?', params[:id])
    @total = 0
    @invoices.each do |item|
      @total += item.total
    end
    @invoice = Invoice.new
    @invoice.total = @total + @invoice.service_charge
    flash.alert = if @invoice.save
                    'please find the below attched invoice'
                    redirect_to invoice_path(@invoice)
                  else
                    'invoice can not be created'
                    redirect_to new_service_update_path
                  end
  end

  def show
    @used_spareparts = UsedSparepart.joins(:sparepart).select(:id, :quantity, :total, 'spareparts.sparepart_name', 'spareparts.price').where('booked_appointment_id = ?', params[:id])
    @total = 0
    @used_spareparts.each do |item|
      @total += item.total
    end
    # @invoice = Invoice.find(params[:id])
    # @used_spareparts = UsedSparepart.used_spareparts
    # @total = @invoice.total - @invoice.service_charge
    @appointment = BookedAppointment.joins(:user).select(:service_center_id, :token, :vehicle_name, :service_date, :service, 'users.username', 'users.email', 'users.contact').find(params[:id])
    @service_center = ServiceCenter.find(@appointment.service_center_id)
  end
end
