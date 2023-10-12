class PingJob < ApplicationJob
  queue_as :default

  discard_on StandardError

  def perform(url)
    response = HTTParty.get(url)

    if ENV["BOB_OPS_RUBYSG_ORGANISER_INCOMING_WEBHOOK_KEY"].presence
      HTTParty.post(
        "https://bobops.net/api/incoming_webhook",
        body: { "text" => "Ping #{url}, Status: #{response.code}" }.to_json,
        headers: {
          "Content-Type" => "application/json",
          "Authorization" => "Bearer #{ENV["BOB_OPS_RUBYSG_ORGANISER_INCOMING_WEBHOOK_KEY"]}"
        }
      )
    end
  end
end
