Rails.application.routes.draw do

  root to: "home#index"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get 'companies/companyregistartion', to: 'companies#new'
  post '/companies', to: 'companies#create'
  get 'companies/:id/editcompany', to: 'companies#edit'  
  post '/companies

end
