Rails.application.routes.draw do
  devise_for :users
 
 #  devise_scope :user do
 #  	root to: "devise/sessions#new"
	# end

	# root to: "devise/sessions#new"
	

	devise_scope :user do
	  authenticated :user do
	    root 'dashboard#index', as: :authenticated_root
	  end

	  unauthenticated do
	    root 'devise/sessions#new', as: :unauthenticated_root
	  end
	end
	
	resources :insumos, only: [:index]
	resources :adubos
		

end
