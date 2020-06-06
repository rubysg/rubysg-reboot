require 'rails_helper'

RSpec.describe Api::RubySgBotController do
  before do
    @telegram_bot_api = TelegramBotApi::Test.new
    allow_any_instance_of(Api::RubySgBotController)
      .to(receive(:telegram_bot_api))
      .and_return(@telegram_bot_api)
  end

  describe "#webhook" do
    def do_request(params = {})
      post :webhook, params: params
    end

    describe "added to group" do
      let(:params) { JSON.parse(file_fixture("ruby_sg_bot_webhook_join_group.json").read) }

      it "creates a new subscriber" do
        do_request(params)

        expect(RubySgBotSubscriber.count).to eq 1
      end

      it "sends message with TelegramBotApi" do
        do_request(params)

        expect(@telegram_bot_api.messages.length).to eq 1
        expect(@telegram_bot_api.messages.first.first).to eq :send_message
      end
    end

    describe "removed from group" do
      let(:params) { JSON.parse(file_fixture("ruby_sg_bot_webhook_left_group.json").read) }

      before { RubySgBotSubscriber.create(chat_id: "-414380229") }

      it "removes a new subscriber" do
        do_request(params)

        expect(RubySgBotSubscriber.count).to eq 0
      end
    end
  end
end
