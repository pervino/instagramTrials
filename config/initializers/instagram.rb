require "instagram"
  Instagram.configure do |config|
  config.client_id = ENV['CLIENT_ID']
  config.access_token = ENV['CLIENT_SECRET']
end