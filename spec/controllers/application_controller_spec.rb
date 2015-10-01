require 'rails_helper'

RSpec.describe ApplicationController do
  describe '#index' do
    def do_request
      get :index
    end

    it 'is successful' do
      do_request

      expect(response).to be_success
    end

    context 'from the future' do
      render_views

      it 'display year correctly' do
        travel_to Time.new(2046, 7, 27, 0, 0, 0) do
          do_request
          expect(response.body).to match '2046'
        end
      end
    end
  end

  describe '#companies' do
    def do_request
      get :companies
    end

    it 'is successful' do
      do_request

      expect(response).to be_success
    end
  end
end
