class TelegramBotApi
  def initialize(token:)
    @base_url = "https://api.telegram.org/bot#{token}"
  end

  def send_message(chat_id, text, parse_mode = "Markdown")
    query_params = "chat_id=#{chat_id}&text=#{text}&parse_mode=#{parse_mode}"
    parsed_url = Addressable::URI.parse("#{@base_url}/sendMessage?#{query_params}")
    response = HTTParty.get(parsed_url.normalize.to_s)

    Rails.logger.info "TelegramBotApi#send_message response.body=#{x.body}"
    response.code == 200
  end

  class Test
    attr_reader :messages

    def initialize
      @messages = []
    end

    def send_message(chat_id, text, parse_mode = "Markdown")
      @messages << [:send_message, chat_id, text, parse_mode]
    end
  end
end
