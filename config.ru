# frozen_string_literal: true

require './lib/rdvbot'

Application.finalize!

run Application['rdvbot.server']
