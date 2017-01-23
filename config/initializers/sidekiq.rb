require 'sidekiq'
require 'sidekiq-status'
#require 'raven/sidekiq'

Sidekiq.configure_client do |config|
  #config.poll_interval = 0.1
  config.client_middleware do |chain|
    chain.add Sidekiq::Status::ClientMiddleware
  end
  redis_url = ENV['REDIS_URL'] || 'redis://localhost:6379/2'
  config.redis = { url: redis_url, size: 5 }
end

Sidekiq.configure_server do |config|
  #config.poll_interval = 0.1
  config.server_middleware do |chain|
    chain.add Sidekiq::Status::ServerMiddleware, expiration: 30.minutes # default
  end
  config.client_middleware do |chain|
    chain.add Sidekiq::Status::ClientMiddleware
  end
  redis_url = ENV['REDIS_URL'] || 'redis://localhost:6379/2'
  config.redis = { url: redis_url, size: 27 }
end
