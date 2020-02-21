Rails.application.routes.draw do

  root to: "home#index"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get 'companies/new', to: 'companies#new'
  post 'companies/', to: 'companies#create'
  get 'companies/updatecompany', to: 'companies#update'  

end
