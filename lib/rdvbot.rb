# frozen_string_literal: true

require 'dry/system'

require_relative 'rdvbot/event/schema'
require_relative 'rdvbot/parser'

class Application < Dry::System::Container
  configure do |config|
    config.root = __dir__
    config.component_dirs.add '.'
  end
end
