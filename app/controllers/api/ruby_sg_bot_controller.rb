class Api::RubySgBotController < Api::ApplicationController
  def webhook
    if ruby_sg_bot_joined_group? && RubySgBotSubscriber.find_or_create_by(chat_id: tg_chat_id.to_s)
      message = <<~TELEGRAM_MESSAGE
      👋 At your service!
      TELEGRAM_MESSAGE

      ::Telegram.bot.send_message(
        chat_id: tg_chat_id,
        text: message,
        parse_mode: :Markdown,
        disable_web_page_preview: true
      )
    elsif ruby_sg_bot_left_group?
      RubySgBotSubscriber.find_by(chat_id: tg_chat_id.to_s)&.destroy
    end

    head :no_content
  end

  private

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
