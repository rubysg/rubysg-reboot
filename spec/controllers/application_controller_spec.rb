require 'rails_helper'

RSpec.describe ApplicationController do
  describe '#index' do

    def do_request
      get :index
    end

    it 'should be success' do
      stub_request(:get, "https://api.meetup.com/2/events?group_urlname=Singapore-Ruby-Group&key=&sign=true").to_return(:status => 200, :body => "", :headers => {})
      do_request
      expect(response).to be_success
    end

    context 'from the future' do
      render_views

      it 'display year correctly' do
        stub_request(:get, "https://api.meetup.com/2/events?group_urlname=Singapore-Ruby-Group&key=&sign=true").to_return(:status => 200, :body => "", :headers => {})
        travel_to Time.new(2046, 7, 27, 0, 0, 0) do
          do_request
          expect(response.body).to match '2046'
        end
      end
    end
  end
end
