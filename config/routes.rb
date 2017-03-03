require 'sidekiq/web'
require 'sidekiq-scheduler'
require 'sidekiq-scheduler/web'
Rails.application.routes.draw do
  resources :yelp, :only => [:index, :create], :path => '/'
  # post 'get-route', to: 'yelp#create', as: 'uber_info'

  get 'information', to: 'home#index', as: 'information'
  resource :messages, :only => [] do
    collection do
      post 'reply'
    end
  end



  resources :ubers, :only => [:index]

  # get 'get-route', to: 'ubers#get_route', as: 'get_route'

  mount Sidekiq::Web, at: '/sidekiq'

end
