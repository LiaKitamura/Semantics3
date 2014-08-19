require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Semantics3
  class Application < Rails::Application
    Mongoid.load!("config/mongoid.yml")
   # Enable the asset pipeline.
    config.assets.enabled = true

    # Add additional load paths for your own custom dirs.
    config.autoload_paths += %W(#{config.root}/app/services lib)

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    config.generators do |g|
      g.fixture_replacement :fabrication
      g.orm             :mongoid
      g.test_framework  :rspec
    end
  end
end
