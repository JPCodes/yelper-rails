Sidekiq.configure_server do |config|
  config.redis = { :url => ENV["REDISTOGO_URL"]}
  # config.redis = { :url => 'redis://localhost:6379'}
end
Sidekiq.configure_client do |config|
  config.redis = { :url => ENV["REDISTOGO_URL"] }
  # config.redis = { :url => 'redis://localhost:6379' }
end
