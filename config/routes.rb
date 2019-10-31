Rails.application.routes.draw do
  get 'messages/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "cocktails#index"
  resources :messages, only: [:new]
end
