Rails.application.routes.draw do
  root to: "home#index"
  post 'admin/adminindex'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  


end
