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
    resources :ownerships, only: [:new, :create, :update]
	end
	
	resources :properties, only: [:index, :new, :create, :update] do
	  resources :ownerships, only: [:update]
	end
	
	resources :insumos, only: [:index, :new, :create]
	resources :adubos
  resources :laudos
  resources :ownerships, only: [:new, :create, :update]
  
end

=begin
	ction
        new_user_session GET    /users/sign_in(.:format)                          devise/sessions#new
            user_session POST   /users/sign_in(.:format)                          devise/sessions#create
    destroy_user_session DELETE /users/sign_out(.:format)                         devise/sessions#destroy
       new_user_password GET    /users/password/new(.:format)                     devise/passwords#new
      edit_user_password GET    /users/password/edit(.:format)                    devise/passwords#edit
           user_password PATCH  /users/password(.:format)                         devise/passwords#update
                         PUT    /users/password(.:format)                         devise/passwords#update
                         POST   /users/password(.:format)                         devise/passwords#create
cancel_user_registration GET    /users/cancel(.:format)                           devise/registrations#cancel
   new_user_registration GET    /users/sign_up(.:format)                          devise/registrations#new
  edit_user_registration GET    /users/edit(.:format)                             devise/registrations#edit
       user_registration PATCH  /users(.:format)                                  devise/registrations#update
                         PUT    /users(.:format)                                  devise/registrations#update
                         DELETE /users(.:format)                                  devise/registrations#destroy
                         POST   /users(.:format)                                  devise/registrations#create
      authenticated_root GET    /                                                 dashboard#index
    unauthenticated_root GET    /                                                 devise/sessions#new
             user_laudos GET    /users/:user_id/laudos(.:format)                  laudos#index
          new_user_laudo GET    /users/:user_id/laudos/new(.:format)              laudos#new
              user_laudo PATCH  /users/:user_id/laudos/:id(.:format)              laudos#update
                         PUT    /users/:user_id/laudos/:id(.:format)              laudos#update
         user_ownerships POST   /users/:user_id/ownerships(.:format)              ownerships#create
      new_user_ownership GET    /users/:user_id/ownerships/new(.:format)          ownerships#new
          user_ownership PATCH  /users/:user_id/ownerships/:id(.:format)          ownerships#update
                         PUT    /users/:user_id/ownerships/:id(.:format)          ownerships#update
                   users GET    /users(.:format)                                  users#index
                         POST   /users(.:format)                                  users#create
                new_user GET    /users/new(.:format)                              users#new
               edit_user GET    /users/:id/edit(.:format)                         users#edit
                    user GET    /users/:id(.:format)                              users#show
                         PATCH  /users/:id(.:format)                              users#update
                         PUT    /users/:id(.:format)                              users#update
                         DELETE /users/:id(.:format)                              users#destroy
     property_ownerships GET    /properties/:property_id/ownerships(.:format)     ownerships#index
  new_property_ownership GET    /properties/:property_id/ownerships/new(.:format) ownerships#new
      property_ownership PATCH  /properties/:property_id/ownerships/:id(.:format) ownerships#update
                         PUT    /properties/:property_id/ownerships/:id(.:format) ownerships#update
              properties GET    /properties(.:format)                             properties#index
                         POST   /properties(.:format)                             properties#create
            new_property GET    /properties/new(.:format)                         properties#new
                 insumos GET    /insumos(.:format)                                insumos#index
                         POST   /insumos(.:format)                                insumos#create
              new_insumo GET    /insumos/new(.:format)                            insumos#new
                  adubos GET    /adubos(.:format)                                 adubos#index
                         POST   /adubos(.:format)                                 adubos#create
               new_adubo GET    /adubos/new(.:format)                             adubos#new
              edit_adubo GET    /adubos/:id/edit(.:format)                        adubos#edit
                   adubo GET    /adubos/:id(.:format)                             adubos#show
                         PATCH  /adubos/:id(.:format)                             adubos#update
                         PUT    /adubos/:id(.:format)                             adubos#update
                         DELETE /adubos/:id(.:format)                             adubos#destroy
                  laudos GET    /laudos(.:format)                                 laudos#index
                         POST   /laudos(.:format)                                 laudos#create
               new_laudo GET    /laudos/new(.:format)                             laudos#new
              edit_laudo GET    /laudos/:id/edit(.:format)                        laudos#edit
                   laudo GET    /laudos/:id(.:format)                             laudos#show
                         PATCH  /laudos/:id(.:format)                             laudos#update
                         PUT    /laudos/:id(.:format)                             laudos#update
                         DELETE /laudos/:id(.:format)                             laudos#destroy
                    page GET    /pages/*id                                        high_voltage/pages#show
=end