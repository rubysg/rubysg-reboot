class SendWeeklyUpdatesJob < ApplicationJob
  queue_as :default

  def perform(id)
    sub = RubySgBotSubscriber.find_by(chat_id: id.to_s)
    featured_articles = ruby_weekly.featured_articles

    send_telegram_message(
      sub.chat_id,
      <<~MARKDOWN
      🛎 *It's Friday! Here are some Ruby goodness, from RubyWeekly, for you~*

      ```
          .     '     ,
            _________
         _ /_|_____|_\\ _
           '. \\   / .'
             '.\\ /.'
               '.'

      ```
      MARKDOWN
    )

    featured_articles.each do |a|
      send_telegram_message(
        sub.chat_id,
        <<~MARKDOWN
        *#{a[:title]}*

        ```text
        #{a[:subtitle]}
        ```
        [Read More!](#{a[:link]})
        MARKDOWN
      )
    end

    send_telegram_message(
      sub.chat_id,
      <<~MARKDOWN
      Thats all folks. Have an awesome weekend~! 👋

      🤖RubySGBot🤖
      MARKDOWN
    )
  end

  private

  def send_telegram_message(chat_id, message)
    Telegram.bot.send_message(
      chat_id: chat_id,
      text: message,
      parse_mode: :Markdown,
      disable_web_page_preview: true
    )
  end

  def ruby_weekly
    RubyWeekly.new
  end
end
