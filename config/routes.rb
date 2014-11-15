 Rails.application.routes.draw do

   devise_for :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'pages#new'

get 'services' => 'pages#services'
get 'about' => 'pages#create'
get 'contact' => 'pages#contact'
get 'gallery' => 'pages#gallery'
get 'news' => 'pages#news'
get 'pages' => 'pages#new'
match "new", :to => "pages#create", via: :post
match 'bookings', :to => 'pages#booking', via: :post


post "about" => "pages#update", :as => "page/update"
get "admin" => "admin#index", :as => "admin/index"
get "admin/gallery" => "admin#gallery", :as => "admin/gallery"
patch "admin" => "admin#update", :as => "admin", via: :post
post "admin" => "admin#save", :as => "admin/save"
post "admin" => "admin#create", :as => "admin/create"


resources :pages



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
