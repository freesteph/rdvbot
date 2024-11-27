# frozen_string_literal: true

# this needs to be the first require which is dodge but I can't figure
# out why so let the good times roll
require 'rdvbot'

require 'dry/system/stubs'
require 'rack/test'

RSpec.configure do |config|
  config.before(:suite) do
    Application.enable_stubs!

    Application.stub(
      'rdvbot.parser',
      lambda { |message|
        "result is #{message}"
      }
    )
  end
end
