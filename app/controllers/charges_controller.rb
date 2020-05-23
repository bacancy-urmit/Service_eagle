# frozen_string_literal: true

class ChargesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_booking_id, only: %i[new create]

  def new; end

  def create
    @amount = @charges.total.to_i
    @payment = Payment.find_by(booked_appointment_id: @appointment)
    @payment.received_payment = @charges.total.to_i

    flash.alert = if @payment.save
                    redirect_to invoice_path(@appointment.id)
                    'payment received! thanks visit us again'
                  else
                    render :new
                    'try again letter'
                  end

    customer = Stripe::Customer.create({
                                         email: params[:stripeEmail],
                                         source: params[:stripeToken]
                                       })

    charge = Stripe::Charge.create({
                                     customer: customer.id,
                                     amount: @amount.to_i * 100,
                                     description: 'Rails Stripe customer',
                                     currency: 'inr'
                                   })
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def find_booking_id
    @charges = Invoice.find(params[:invoice_id])
    @appointment = @charges.booked_appointment
  end
end
