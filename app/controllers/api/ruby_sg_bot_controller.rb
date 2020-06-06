class Api::RubySgBotController < Api::ApplicationController
  def webhook
    if join_group?
      if RubySgBotSubscriber.find_or_create_by(chat_id: tg_chat_id.to_s)
        telegram_bot_api.send_message(
          tg_chat_id,
          <<~TELEGRAM_MESSAGE
          👋 At your service!
          TELEGRAM_MESSAGE
        )
      end
    elsif left_group?
      RubySgBotSubscriber.find_by(chat_id: tg_chat_id.to_s)&.destroy
    end

    head :no_content

  rescue ArgumentError
    # if return code is not 2XX, telegram api will keep sending the request.
    #   There is no error logging for the application for the moment therefore
    #   just letting it fail silently for now.
    head :no_content
  end

  private

  def telegram_bot_api
    TelegramBotApi.new(ENV["RUBY_SG_BOT_TOKEN"])
  end

  def rubysg_bot_id
    "1292813591"
  end

  def join_group?
    tg_object[:chat][:type] == "group" &&
      tg_object[:new_chat_member] &&
      tg_object[:new_chat_member][:id].to_s == rubysg_bot_id
  end

  def left_group?
    tg_object[:chat][:type] == "group" &&
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
