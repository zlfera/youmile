Sidekiq.configure_server do |config|
  config.redis = {url: Rails.application.secrets.redis_url, size: 50, network_timeout: 5}
end

Sidekiq.configure_client do |config|
  config.redis = {url: Rails.application.secrets.redis_url, size: 30, network_timeout: 5}
end
