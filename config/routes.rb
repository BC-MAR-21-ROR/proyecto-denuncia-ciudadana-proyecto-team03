Rails.application.routes.draw do
  get 'postals/:id', to: "postals#show"
  resources :interest_places
  resources :complaints
	resources :adminpanel

	# Panel
	get '/adminpanel/:id/edit', :to => 'adminpanel#edit', :as => :user
	patch '/adminpanel/:id/edit' => "adminpanel#update", :as => "adminpanel/update"

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
