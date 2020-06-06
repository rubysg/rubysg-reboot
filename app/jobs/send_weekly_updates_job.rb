class SendWeeklyUpdatesJob < ApplicationJob
  queue_as :default

  def perform(id)
    sub = RubySgBotSubscriber.find_by(chat_id: id.to_s)

    telegram_bot_api.send_message(
      sub.chat_id,
      <<~TEXT_MESSAGE
      🛎 *It's Friday! Here are some Ruby goodness for you~*

      ```
          .     '     ,
            _________
         _ /_|_____|_\\ _
           '. \\   / .'
             '.\\ /.'
               '.'
      ```
      🗞 https://rubyweekly.com/latest

      Have an awesome weekend~!
      🤖RubySGBot🤖
      TEXT_MESSAGE
    )
  end

  private

  def telegram_bot_api
    TelegramBotApi.new(ENV["RUBY_SG_BOT_TOKEN"])
  end
end
