# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'

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
  resources :used_spareparts do
    get 'search', to: 'used_spareparts#search'
  end
end
