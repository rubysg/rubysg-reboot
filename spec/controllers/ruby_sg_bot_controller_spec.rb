require 'rails_helper'
require 'telegram/bot/rspec/integration/rails'

RSpec.describe Api::RubySgBotController, telegram_bot: :rails do
  describe "#webhook" do
    def do_request(params = {})
      post :webhook, params: params
    end

    describe "added to group" do
      let(:params) { JSON.parse(file_fixture("telegram_bot_webhooks/message_join_group.json").read) }

      it "creates a new subscriber" do
        do_request(params)

        expect(RubySgBotSubscriber.count).to eq 1
      end

      it "sends message with TelegramBotApi" do
        expect { do_request(params) }.to(
          make_telegram_request(Telegram.bot, :sendMessage).
            with(hash_including(text: "👋 At your service!\n"))
        )
      end
    end

    describe "added to supergroup" do
      let(:params) { JSON.parse(file_fixture("telegram_bot_webhooks/message_join_supergroup.json").read) }

      it "creates a new subscriber" do
        do_request(params)

        expect(RubySgBotSubscriber.count).to eq 1
      end

      it "sends message with TelegramBotApi" do
        expect { do_request(params) }.to(
          make_telegram_request(Telegram.bot, :sendMessage).
            with(hash_including(text: "👋 At your service!\n"))
        )
      end
    end

    describe "removed from group" do
      let(:params) { JSON.parse(file_fixture("telegram_bot_webhooks/message_left_group.json").read) }

      before { RubySgBotSubscriber.create(chat_id: "-321") }

      it "removes a new subscriber" do
        do_request(params)

        expect(RubySgBotSubscriber.count).to eq 0
      end
    end

    describe "removed from supergroup" do
      let(:params) { JSON.parse(file_fixture("telegram_bot_webhooks/message_left_supergroup.json").read) }

      before { RubySgBotSubscriber.create(chat_id: "-123") }

      it "removes a new subscriber" do
        do_request(params)

        expect(RubySgBotSubscriber.count).to eq 0
      end
    end

    describe "other webhook event types" do
      let(:params) { JSON.parse(file_fixture("telegram_bot_webhooks/my_chat_member_update.json").read) }

      before { RubySgBotSubscriber.create(chat_id: "-123") }

      it "no-op the request and returns 204" do
        do_request(params)

        expect(response).to have_http_status :no_content
      end
    end
  end
end
