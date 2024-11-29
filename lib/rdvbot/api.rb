# frozen_string_literal: true

module Rdvbot
  class API
    def search_by(username:)
      Application['mattermost_api'].post('users/search', { term: username })
    end

    def create_dialog(trigger_id, payload)
      payload = {
        trigger_id: trigger_id,
        dialog: Application['rdvbot.confirm_dialog'].call(payload),
        url: "#{ENV.fetch('RDVBOT_URL')}/confirm"
      }

      Application['mattermost_api'].post('actions/dialogs/open', payload)
    end
  end
end
