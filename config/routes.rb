Rails.application.routes.draw do

  get 'cast' => 'profiles#cast'

  get 'profile/:id', to: 'profiles#index', as: 'profile'

  get 'profile/history' => 'profiles#history'

  get 'profile/stats' => 'profiles#stats'

  get 'leagues/index' =>'leagues#index'

  get 'leagues/new' => 'leagues#new'

  get 'leagues/join' => 'leagues#join'

  get 'teams/index'

  post 'teams/select_chars' => 'teams#select_chars'

  post 'league/leaguesubmit' => 'leagues#leaguesubmit'

  post 'league/newprivate' => 'leagues#newprivate'

  post 'league/joinprivate' => 'leagues#joinprivate'

  get "game/leaderboard" => 'game#leaderboard'

  get "/about" => 'home#about'


  resources :game, :teams

  devise_for :users, :controllers => { registrations: 'registrations' }


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  # post 'teams' => 'teams#index', as: 'team_final'

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
