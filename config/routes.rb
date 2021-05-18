Rails.application.routes.draw do
  resources :interest_places
  resources :complaints
  devise_for :users
  devise_scope :user do
  	authenticated :user do
  	  root to: "home#index"
  	end
  	unauthenticated do
  	  root 'devise/sessions#new', as: :unauthenticated_root
  	end
  end
end
