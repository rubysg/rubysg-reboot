require 'rails_helper'

RSpec.describe Api::RubySgBotController do
  describe '#webhook' do
    def do_request
      post :webhook
    end

    it 'is successful' do
      do_request

      expect(response).to be_success
    end
  end
end
