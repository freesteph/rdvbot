# frozen_string_literal: true

require 'json'

module Rdvbot
  # Looks up Mattermost contacts
  class Directory
    def email_for(username)
      Application['rdvbot.api']
        .search_by(username: username)
        .body
        .first
        &.dig('email')
    end
  end
end
