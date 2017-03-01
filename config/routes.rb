require 'sidekiq/web'
require 'sidekiq-scheduler'
require 'sidekiq-scheduler/web'
Rails.application.routes.draw do

  resource :messages do
    collection do
      post 'reply'
    end
  end

  mount Sidekiq::Web, at: '/sidekiq'

end
