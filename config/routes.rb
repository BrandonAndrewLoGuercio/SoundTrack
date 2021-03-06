Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  resources :users do
    get :followers, on: :member
    get :following, on: :member
  end
  resources :relationships
  match('/following', {via: :get, to: "following#index"})
  match('/followers', {via: :get, to: "followers#index"})
  resources :posts do
    resources :comments
  end
  resources :notifications

  get '/get_notifications', to: 'notifications#get_notifications'


  # devise_scope :user do
  #   get 'sign_out', to: 'devise/session#destroy', :as => :destroy_user_session
  # end

  match('relationship/:follower_id/:following_id', {via: :delete, to: "relationships#destroy_via_users", as: "destroy_users_relationship"})
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'my_posts', to: 'posts#my_posts'
  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
