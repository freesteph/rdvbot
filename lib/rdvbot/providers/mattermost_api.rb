# frozen_string_literal: true

require 'dotenv/load'
require 'json'
require 'faraday'

require_relative '../../rdvbot'

Application.register_provider(:mattermost_api) do
  start do
    register(:mattermost_api) do
      url, token = %w[URL TOKEN].map { |part| ENV.fetch("RDVBOT_MATTERMOST_API_#{part}") }

      Faraday::Connection.new(url) do |connection|
        connection.request :authorization, 'Bearer', token
        connection.request :json
        connection.response :json
      end
    end
  end
end
