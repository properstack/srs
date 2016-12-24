require_relative 'boot'

require 'csv'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Srs
  class Application < Rails::Application

    config.assets.precompile += %w(cards.css cards_cheat.css decks_index.css)



  	config.app_generators.scaffold_controller = :scaffold_controller
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
