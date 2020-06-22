require 'rails_helper'

RSpec.describe CompaniesController do
  describe '#index' do
    render_views

    def do_request
      get :index
    end

    it 'is successful' do
      do_request

      expect(response).to be_successful
    end
  end
end
