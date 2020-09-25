Rails.application.routes.draw do
  root :to => 'root#top'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  get "home/about" => "root#about"
  resources :books
  resources :users, only: [:new, :show, :index, :edit, :create, :destroy]
end
