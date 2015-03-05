require 'rails_helper'

RSpec.describe InvitationsController do
  describe '#create' do
    def do_request
      post :create, invitation: params
    end

    context 'success' do
      let(:params) { { email: 'abc@example.com' } }

      before { expect(Invitation).to receive(:post) { {'ok' => true} } }

      it 'sends invite' do
        do_request
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to be_present
      end
    end

    context 'failure' do
      let(:params) { { email: '' } }

      it 'redirects with flash error' do
        do_request
        expect(response).to redirect_to root_path
        expect(flash[:alert]).to be_present
      end
    end
  end
end
