class Api::RubySgBotController < Api::ApplicationController
  def webhook
    if ruby_sg_bot_joined_group? && RubySgBotSubscriber.find_or_create_by(chat_id: tg_chat_id.to_s)
      telegram_bot_api.send_message(
        tg_chat_id,
        <<~TELEGRAM_MESSAGE
        👋 At your service!
        TELEGRAM_MESSAGE
      )
    elsif ruby_sg_bot_left_group?
      RubySgBotSubscriber.find_by(chat_id: tg_chat_id.to_s)&.destroy
    end

    head :no_content
  end

  private

  def telegram_bot_api
    TelegramBotApi.new(token: ENV["RUBY_SG_BOT_TOKEN"])
  end

  def rubysg_bot_id
    "1292813591"
  end

  def ruby_sg_bot_joined_group?
    (tg_object[:chat][:type] == "group" || tg_object[:chat][:type] == "supergroup") &&
      tg_object[:new_chat_member] &&
      tg_object[:new_chat_member][:id].to_s == rubysg_bot_id
  end

  def ruby_sg_bot_left_group?
    (tg_object[:chat][:type] == "group" || tg_object[:chat][:type] == "supergroup") &&
      tg_object[:left_chat_member] &&
      tg_object[:left_chat_member][:id].to_s == rubysg_bot_id
  end

  def tg_chat_id
    tg_object[:chat][:id]
  end

  def tg_object
    @tg_object ||= params
      .require(:message)
      .permit(
        chat: [:id, :type],
        new_chat_member: [:id],
        left_chat_member: [:id]
      )
  end
end
