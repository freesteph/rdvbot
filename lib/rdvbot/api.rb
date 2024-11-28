# frozen_string_literal: true

module Rdvbot
  class API
    def search_by(username:)
      Application['mattermost_api'].post('users/search', { term: username })
    end
  end
end
