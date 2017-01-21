require 'sidekiq/web'
Rails.application.routes.draw do
  resources :inventions do
    resources :photos
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'inventions#index'
  resources :users do
    member do
      get :preferences
    end
  end

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
