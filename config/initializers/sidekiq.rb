Sidekiq.configure_server do |config|
  config.redis = {url: 'redis://redistogo:83dce8bccc69228d5bbafaa9829c6645@dab.redistogo.com:9209/'}
end

Sidekiq.configure_client do |config|
  config.redis = {url: 'redis://redistogo:83dce8bccc69228d5bbafaa9829c6645@dab.redistogo.com:9209/'}
end
