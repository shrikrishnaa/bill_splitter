Rails.application.routes.draw do
  resources :user_owe_details
  resources :user_event_details
  resources :events
  devise_for :users

  root "user_owe_details#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
