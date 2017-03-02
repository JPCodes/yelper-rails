require 'sidekiq/web'
require 'sidekiq-scheduler'
require 'sidekiq-scheduler/web'
Rails.application.routes.draw do

  root to: "yelp#index"
  get 'information', to: 'home#index', as: 'information'
  resource :messages, :only => [] do
    collection do
      post 'reply'
    end
  end

  resources :ubers, :only => [:index]
  resources :yelp
  get 'get-route', to: 'ubers#get_route', as: 'get_route'

  mount Sidekiq::Web, at: '/sidekiq'

end
