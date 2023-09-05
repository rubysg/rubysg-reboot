class SendWeeklyUpdatesJob < ApplicationJob
  queue_as :default

  retry_on(StandardError, attempts: 3) do |job, error|
    Rails.logger.debug error.full_message
    job.send_failure_notification(error)
  end

  def perform(id)
    sub = RubySgBotSubscriber.find_by!(chat_id: id.to_s)
    featured_articles = RubyWeekly.new.featured_articles

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

  def send_failure_notification(error)
    return unless ENV["BOB_OPS_RUBYSG_ORGANISER_INCOMING_WEBHOOK_KEY"].presence

    HTTParty.post(
      'https://bobops.net/api/incoming_webhook',
      body: {
        text: <<~NOTIFICATION
          #{error.class.name}@SendWeeklyUpdatesJob
          #{error.message}
        NOTIFICATION
      }.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  def send_telegram_message(chat_id, message)
    Telegram.bot.send_message(
      chat_id: chat_id,
      text: message,
      parse_mode: :Markdown,
      disable_web_page_preview: true
    )
  end
end
