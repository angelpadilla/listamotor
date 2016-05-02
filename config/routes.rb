Rails.application.routes.draw do
  resources :galleries
  resources :states
  resources :brands
  devise_for :users
  resources :pins



  get 'store/:id', to: 'front#show', as: :store
  get 'my-cars', to: 'front#my_cars', as: :my_cars
  get 'index', to: 'front#index', as: :index
  get 'admin', to: 'admin#home', as: :admin

  post 'pins/:post_id/like', to: 'cars/likes#create', as: :increase_like
  delete 'pins/:post_id/like', to: 'cars/likes#destroy', as: :destroy_like

  get 'likes', to: 'front#likes', as: :likes


  get 'index/cheap', to: 'front#cheap', as: :cheap_search
  get 'index/no-cheap', to: 'front#no_cheap', as: :no_cheap_search
  get 'index/classics', to: 'front#classics', as: :classics_search
  get 'index/moderns', to: 'front#modern', as: :moderns_search


  root 'home#front'

  get ':id', to: 'pins#show', as: :show_car

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
