require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Littlebits
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: false
      g.helper :prefab
      g.stylesheets false
      g.fixture_replacement :fabrication, dir: "spec/fabricators"
    end

    config.autoload_paths += %W(#{config.root}/app/datatables
                                #{config.root}/app/inputs
                                #{config.root}/app/services
                                #{config.root}/lib)

  end
end
