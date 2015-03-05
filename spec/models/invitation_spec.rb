require 'rails_helper'

RSpec.describe Invitation do
  context 'validations' do
    it { is_expected.to validate_presence_of :email }
  end

  describe '#create_and_send' do
    context 'valid' do
      let(:email) { 'abc@example.com' }

      context 'success' do
        before do
          stub_request(:post, /https:\/\/#{ENV['SLACK_TEAM']}\.slack\.com\/api\/users\.admin\.invite\?t=.*/)
            .with(:body => "email=#{CGI.escape(email)}&channels=#{ENV['SLACK_CHANNELS']}&token=#{ENV['SLACK_TOKEN']}&set_active=true&_attempts=1")
            .to_return(:status => 200, :body => {ok: true}.to_json, :headers => {'content-type': ['application/json; charset=utf-8']})
       end

        it 'returns true without errors' do
          invitation = Invitation.new(email: email)
          expect(invitation.create_and_send).to be_truthy
          expect(invitation.errors).to be_blank
        end
      end

      context 'failure' do
        before do
          stub_request(:post, /https:\/\/#{ENV['SLACK_TEAM']}\.slack\.com\/api\/users\.admin\.invite\?t=.*/)
            .with(:body => "email=#{CGI.escape(email)}&channels=#{ENV['SLACK_CHANNELS']}&token=#{ENV['SLACK_TOKEN']}&set_active=true&_attempts=1")
            .to_return(:status => 200, :body => {ok: false, errors: 'not_authed'}.to_json, :headers => {'content-type': ['application/json; charset=utf-8']})
        end

        it 'returns true without errors' do
          invitation = Invitation.new(email: email)
          expect(invitation.create_and_send).to be_falsey
          expect(invitation.errors[:email]).to be_present
        end
      end
    end

    context 'invalid' do
      it 'returns false with errors' do
        invitation = Invitation.new(email: '')
        expect(invitation.create_and_send).to be_falsey
        expect(invitation.errors[:email]).to be_present
      end
    end
  end
end
