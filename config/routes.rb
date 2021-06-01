Rails.application.routes.draw do
  get 'states/:id', to: "states#show"
  get 'municipalities/:id', to: "municipalities#show"
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
      root to: 'home#welcome', as: :unauthenticated_root
    end
  end
end
