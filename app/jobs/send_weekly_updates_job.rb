class SendWeeklyUpdatesJob < ApplicationJob
  queue_as :default

  def perform(id)
    sub = RubySgBotSubscriber.find_by(chat_id: id.to_s)
    featured_articles = ruby_weekly.featured_articles

    # Not sure what went wrong, but there are some weeks where the message is
    # not getting sent out. In this code block, it is most likely that either
    # the message get sends or nothing get sends. Therefore we can safely retry
    # the sending of the messages. If after 5 attempts, it still fail, then we
    # should take a look at the log to see what happened.
    inline_retry_on(retry_count: 5) do |index|
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

      featured_articles.each_slice(5) do |articles|
        message = <<~MARKDOWN
        testing
        MARKDOWN

        message = articles.map do |a|
          <<~MARKDOWN
          *#{a[:title]}*

          ```text
          #{a[:subtitle]}
          ```
          [Read More!](#{a[:link]})
          MARKDOWN
        end.join("\n")

        send_telegram_message(
          sub.chat_id,
          message
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
