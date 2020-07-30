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
	
	resources :users do 
	  resources :laudos, only: [:index, :new, :update]
	end
	
	resources :properties, only: [:index] do
	  resources :ownerships, only: [:new, :create, :update]
	end
	
	resources :insumos, only: [:index, :new]
	resources :adubos

	resources :laudos, only: [:index, :new] do
		resources :properties, only: [:show, :create]
	end

end

=begin
	authenticated_root GET    /                                                 dashboard#index
    unauthenticated_root GET    /                                                 devise/sessions#new
             user_laudos GET    /users/:user_id/laudos(.:format)                  laudos#index
          new_user_laudo GET    /users/:user_id/laudos/new(.:format)              laudos#new
              user_laudo PATCH  /users/:user_id/laudos/:id(.:format)              laudos#update
                         PUT    /users/:user_id/laudos/:id(.:format)              laudos#update
                   users GET    /users(.:format)                                  users#index
                         POST   /users(.:format)                                  users#create
                new_user GET    /users/new(.:format)                              users#new
               edit_user GET    /users/:id/edit(.:format)                         users#edit
                    user GET    /users/:id(.:format)                              users#show
                         PATCH  /users/:id(.:format)                              users#update
                         PUT    /users/:id(.:format)                              users#update
                         DELETE /users/:id(.:format)                              users#destroy
     property_ownerships POST   /properties/:property_id/ownerships(.:format)     ownerships#create
  new_property_ownership GET    /properties/:property_id/ownerships/new(.:format) ownerships#new
      property_ownership PATCH  /properties/:property_id/ownerships/:id(.:format) ownerships#update
                         PUT    /properties/:property_id/ownerships/:id(.:format) ownerships#update
              properties GET    /properties(.:format)                             properties#index
                 insumos GET    /insumos(.:format)                                insumos#index
              new_insumo GET    /insumos/new(.:format)                            insumos#new
                  adubos GET    /adubos(.:format)                                 adubos#index
                         POST   /adubos(.:format)                                 adubos#create
               new_adubo GET    /adubos/new(.:format)                             adubos#new
              edit_adubo GET    /adubos/:id/edit(.:format)                        adubos#edit
                   adubo GET    /adubos/:id(.:format)                             adubos#show
                         PATCH  /adubos/:id(.:format)                             adubos#update
                         PUT    /adubos/:id(.:format)                             adubos#update
                         DELETE /adubos/:id(.:format)                             adubos#destroy
        laudo_properties POST   /laudos/:laudo_id/properties(.:format)            properties#create
          laudo_property GET    /laudos/:laudo_id/properties/:id(.:format)        properties#show
                  laudos GET    /laudos(.:format)                                 laudos#index
			   new_laudo GET    /laudos/new(.:format)                             laudos#new
=end