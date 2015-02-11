Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks'}

  devise_scope :user do
    get 'auth/sign_in', to: 'devise/sessions#new', as: :new_user_session
    get 'auth/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  namespace :api do
    namespace :v1 do
      get 'me', to: 'user_info#user', as: :user

      resources :albums
      resources :antennas
      resources :base_station_units
      resources :base_station_sectors
      resources :cities
      resources :clients
      resources :client_links do
        member { get 'audit' }
      end
      resources :core_nodes
      resources :equipment
      resources :group_classifications
      resources :link_types
      resources :modems
      resources :network_operators
      resources :pictures
      resources :radios
      resources :statuses
      resources :sub_group_classifications
      resources :sub_group_picture_sets
    end
  end
end
