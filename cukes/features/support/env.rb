require 'factory_girl'
require 'active_record'
require 'paper_trail'
require 'pry'
require 'database_cleaner'
require 'active_support/dependencies'
require_relative '../../config/cukes'
require 'site_prism'
require 'capybara/cucumber'
require 'capybara/poltergeist'

Capybara.default_driver = Cukes.config.browser
Capybara.app_host = Cukes.config.host
Capybara.default_wait_time = Cukes.config.startup_timeout

# Silence paper_trail deprecation warning
current_behavior = ActiveSupport::Deprecation.behavior
ActiveSupport::Deprecation.behavior = lambda do |message, callstack|
  return if message =~ /`serialized_attributes` is deprecated without replacement/ && callstack.any? { |m| m =~ /paper_trail/ }
  Array.wrap(current_behavior).each { |behavior| behavior.call(message, callstack) }
end

options = {
  :window_size => [1920, 6000]
}
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, options)
end

# Require Models
ActiveSupport::Dependencies.autoload_paths += Dir.glob File.join(Cukes.config.rails_root, "app/models")

# Require Factories
Dir["#{Cukes.config.rails_root}/spec/factories/*.rb"].each { |f| require f }

# Connect to Test Database, suggest simply symlinking your actual database.yml from backend to config/database.yml in this project
# If you are using sqlite, you'll need a separate database.yml for this project with the relative path to the backend test.sqlite file
database_yml = File.expand_path('../../../config/database.yml', __FILE__)
if File.exists?(database_yml)
  active_record_configuration = YAML.load_file(database_yml)
  ActiveRecord::Base.configurations = active_record_configuration
  config = ActiveRecord::Base.configurations['test']
  ActiveRecord::Base.establish_connection(config)
else
  raise "Please create #{database_yml} first to configure your test database"
end

# Application Manager will start up the rails and ember apps before the suite is run and shut them down when we're finished
manager = ApplicationManager.new
manager.start_stack
at_exit do
  manager.stop_stack
end

AfterStep do
  sleep (ENV['PAUSE'] || 0).to_i
end

# Require Seeds to init db
Dir["#{Cukes.config.rails_root}/db/seeds/*.seeds.rb"].each { |f| require f }

# Database Cleaner to clear out the test DB between tests
require 'database_cleaner/cucumber'
DatabaseCleaner.strategy = :truncation,  {:except => %w[cities clients group_classifications sub_group_classifications link_types statuses]}
Around do |scenario, block|
  DatabaseCleaner.cleaning(&block)
end

# Shorthand FactoryGirl
include FactoryGirl::Syntax::Methods


