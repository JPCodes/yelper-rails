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

  mount Sidekiq::Web, at: '/sidekiq'

end
