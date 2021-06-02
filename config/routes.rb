Rails.application.routes.draw do
  get 'states/:id', to: "states#show"
  get 'municipalities/:id', to: "municipalities#show"
  get 'postals/:id', to: "postals#show"

  resources :interest_places
  resources :complaints do
    resources :comments, only: %i[create destroy]
  end
  get 'complaints/showMyComplaints/:id', to: 'complaints#showMyComplaints', as: 'complaints/showMyComplaints'

	resources :adminpanel

  post 'like/:id', to: 'likes#create', as: 'like'
  delete 'unlike/:id', to: 'likes#destroy', as: 'unlike'

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
