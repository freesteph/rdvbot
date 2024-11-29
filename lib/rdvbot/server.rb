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
        required(:trigger_id).filled(:str?)
      end
    end

    post '/receive' do
      result = RECEIVE_CONTRACT.call(request.params)

      if result.success?
        Application['rdvbot.parser']
          .call(request.params['text'])
          .then do |parsed|
          Application['rdvbot.api'].create_dialog(
            request.params['trigger_id'],
            JSON.parse(parsed)
          )
        end
      else
        status 422
        body({ errors: result.errors.to_h }.to_json)
      end
    end
  end
end
