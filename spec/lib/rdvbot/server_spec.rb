# frozen_string_literal: true

require 'spec_helper'

require 'rdvbot/server'

RSpec.describe Rdvbot::Server do
  include Rack::Test::Methods

  def app
    described_class
  end

  describe '/receive' do
    context 'when there is no message in the request params' do
      it 'fails' do
        expect(post('/receive')).not_to be_ok
      end

      it 'returns a helpful list of errors' do
        response = JSON.parse(post('/receive').body)

        expect(response['errors']).to include('text' => ['is missing'])
      end
    end

    context 'when there is a proper message in the params' do
      it 'returns 200' do
        response = post('/receive', text: 'sample text')

        expect(response).to be_ok
      end
    end
  end
end
