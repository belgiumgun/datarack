Datarack::Application.routes.draw do
  #devise_for :users
#  get "welcome/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


  # You can have the root of your site routed with "root"
       root 'welcome#index'
  

  match '/user/createfile' => 'welcome#insertfile', via: :all  
  match '/record/delete' => 'welcome#delete_record', via: :post  
  
  match "/home" => 'welcome#index', via: :get
  match "/candidate_form" =>'welcome#candidate_form', via: :get
  match '/index' => 'welcome#index', via: :all
  match "/candidate/search" =>"welcome#candidate_search", via: :post

  match "/file/download" =>"welcome#download_file",via: :post
  match "/candidate/details_show"  => "welcome#show_details", via: :all
  
  match 'record/edit' => "welcome#edit_candidate_details", via: :all
  
  match 'candidate/details_update' => 'welcome#update_candidate_details', via: :patch

  #Routing for DEVISE - USERS
  devise_for :users
 # devise_for :users,:path =>"auth", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'new_user' }
  
 
  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
