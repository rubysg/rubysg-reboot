class SendWeeklyUpdatesJob < ApplicationJob
  queue_as :default

  def perform(id)
    sub = RubySgBotSubscriber.find_by(chat_id: id.to_s)

    featured = ruby_weekly.featured_articles.each_with_index.map do |a, i|
      <<~MARKDOWN
      #{i+1}. #{a[:title]}. [Read More!](#{a[:link]})
        ```text
        #{a[:subtitle]}
        ```
      MARKDOWN
    end.join("\n")

    message = construct_message do
      <<~MARKDOWN
      🗞 _Ruby Weekly_
      #{ruby_weekly.issue_link}

      #{featured}
      MARKDOWN
    end

    telegram_bot_api.send_message(sub.chat_id, message)
  end

  def construct_message(&block)
    header = <<~MARKDOWN
      🛎 *It's Friday! Here are some Ruby goodness for you~*

      ```
          .     '     ,
            _________
         _ /_|_____|_\\ _
           '. \\   / .'
             '.\\ /.'
               '.'

      ```
    MARKDOWN

    footer = <<~MARKDOWN

      Thanks all folks. Have an awesome weekend~! 👋
      🤖RubySGBot🤖
    MARKDOWN

    header + yield + footer
  end

  private

  def ruby_weekly
    RubyWeekly.new
  end

  def telegram_bot_api
    TelegramBotApi.new(token: ENV["RUBY_SG_BOT_TOKEN"])
  end
end
