class Cukes
  require 'active_support/configurable'
  include ActiveSupport::Configurable

  self.configure do |config|
    config.root = Dir[File.dirname(File.expand_path('../', __FILE__))].first
    config.rails_root = File.join(config.root, "..", "rails")
    config.rails_started_message = "Listening on tcp://"
    config.ember_root = File.join(config.root, "..", "ember")
    config.ember_started_message = "Build successful"
    config.host = "http://localhost:4200"
    config.browser = (ENV["BROWSER"] || 'selenium').to_sym
    config.startup_timeout = 15
  end

end
