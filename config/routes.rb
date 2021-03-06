RegistrationApp::Application.routes.draw do
  get "sessions/new"

  resources :events
  resources :event_selections
  resources :event_types
  
  resources :registrations
  resources :participants  	
  resources :seasons  	

  resources :volunteer_insterests
  resources :volunteer_selections
  
  resources :sessions, :only => [:new, :create, :destroy]
  
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy' 	
  
  #get "events/new"
  match '/newevent', :to => 'events#new'

  match '/newregistration', :to => 'registrations#new'
  #match '/editregistration/:id', :to => 'registrations#edit'
  match '/editregistration', :to => 'registrations#edit'
  match '/deleteregistration', :to => 'registrations#destroy'
  match '/findregistration', :to => 'registrations#find'
  match '/copyregistration', :to => 'registrations#copy'
  match '/excelexport', :to => 'registrations#export'
  match '/excelemails', :to => 'registrations#export_emails'
  match '/excelparentemails', :to => 'registrations#export_parent_emails'
  match '/excelathleteemails', :to => 'registrations#export_athlete_emails'

  get "registrations/new"
  get "registrations/edit"
  get "registrations/update"
  get "registrations/show"
  get "registrations/index"
  get "registrations/destroy"
  get "registrations/create"
  get "registrations/find"
  get "registrations/copy"
  
  get "events/show"
  get "events/index"
  get "events/edit"
  get "events/update"
  get "events/create"
  get "events/destroy"
  #get "users/new"

  root :to => "pages#home"

  match '/contact', :to => 'pages#contact'
  match '/about', :to => 'pages#about'
  match '/registration_area', :to => 'pages#registration_area'
  #match '/help', :to => 'pages#help'
  
  #match '/signup', :to => 'users#new'
  
  #get "pages/home"

  #get "pages/contact"

  #get "pages/about"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
