# frozen_string_literal: true

module Rdvbot
  module Event
    SCHEMA = {
      type: 'object',
      properties: {
        title: {
          type: 'string',
          description: 'The provided event name'
        },
        start: {
          type: 'string',
          description: 'date and time of the event start'
        },
        ending: {
          type: 'string',
          description: 'date and time of the event end'
        },
        duration: {
          type: 'number',
          description: 'the duration in minutes of the event'
        },
        location: {
          type: 'string',
          description: 'the location of the event'
        }

      },
      required: ['title'],
      additionalProperties: false
    }.freeze
  end
end
