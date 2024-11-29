# frozen_string_literal: true

require 'dry/system'

class Application < Dry::System::Container
  configure do |config|
    config.root = __dir__
    config.component_dirs.add '.'
    config.provider_dirs = [
      File.join(
        __dir__,
        'rdvbot',
        'providers'
      )
    ]
  end
end
