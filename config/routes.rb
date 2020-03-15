# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'booked_appointments#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'

  }
  get 'booked_appointments/xyz', to: 'booked_appointments#xyz'
  resources :super_admins
  resources :company_admin
  resources :booked_appointments
  resources :companies
  resources :service_centers
  resources :service_center_capacities
  resources :service_center_admins
  resources :spareparts
  resources :service_updates
  resources :used_spareparts
  resources :invoices
  resources :charges
  get '/invoices/:service_update_id/generate_invoice', to: 'invoices#generate_invoice', as: 'generate_invoice'
end
