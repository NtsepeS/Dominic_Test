require 'active_support/configurable'
require 'dotenv'

Dotenv.load! "../.env"

class Cukes
  include ActiveSupport::Configurable

  self.configure do |config|
    config.root = Dir[File.dirname(File.expand_path('../', __FILE__))].first

    config.rails_root = File.join(config.root, "..", "rails")
    config.rails_started_message = "Listening on tcp://"

    config.ember_root = File.join(config.root, "..", "ember")
    config.ember_started_message = "Build successful"

    config.proxy_root = File.join(config.root, "..")
    config.proxy_started_message = "Proxying port"

    config.host = "http://localhost:#{ENV['PROXY_PORT']}"
    config.browser = (ENV["BROWSER"] || 'selenium').to_sym
    config.startup_timeout = 15
  end

end
