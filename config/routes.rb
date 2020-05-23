# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
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
  get '/service_center_admin/show_pending_appointments', to: 'service_center_admins#show_pending_appointments', as: 'service_center_admin/pending_appointments'
  get '/service_updtes/:booking_id/new', to: 'service_updates#new', as: 'new_update'
  get '/charges/:invoice_id/make_payment', to: 'charges#new', as: 'make_payment'
  post '/charges/:invoice_id/make_payment', to: 'charges#create', as: 'payment_confirmation'
  get '/invoices/:service_update_id/generate_invoice', to: 'invoices#generate_invoice', as: 'generate_invoice'
end
