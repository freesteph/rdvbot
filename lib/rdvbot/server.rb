# frozen_string_literal: true

require 'json'
require 'sinatra/reloader'
require 'sinatra/json'
require 'rack/contrib'

require 'rdvbot'
require 'dry-validation'

module Rdvbot
  class Server < Sinatra::Base
    register Sinatra::Reloader

    use Rack::JSONBodyParser

    RECEIVE_CONTRACT = Dry::Validation.Contract do
      params do
        required(:text).filled(:str?)
      end
    end

    post '/receive' do
      result = RECEIVE_CONTRACT.call(request.params)

      if result.success?
        parsed = Application['rdvbot.parser'].call(request.params['text'])

        response = {
          response_type: 'in_channel',
          text: "```json\n#{parsed}```"
        }

        json response
      else
        status 422
        body({ errors: result.errors.to_h }.to_json)
      end
    end
  end
end
