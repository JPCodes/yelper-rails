require 'sidekiq/web'
require 'sidekiq-scheduler'
require 'sidekiq-scheduler/web'
Rails.application.routes.draw do

  root to: "home#index"
  resource :messages, :only => [] do
    collection do
      post 'reply'
    end
  end

  resources :ubers, :only => [:index]
  get 'get-route', to: 'ubers#get_route', as: 'get_route'

  mount Sidekiq::Web, at: '/sidekiq'

end
