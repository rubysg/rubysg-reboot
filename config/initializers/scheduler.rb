require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

return if defined?(Rails::Console) || Rails.env.test? || File.split($0).last == 'rake' || ENV["INCLUDES_SCHEDULER"].present?

# Send weekly news updates on Friday 5:30pm
s.cron '30 17 * * 5' do
  RubySgBotSubscriber.in_batches.each_record do |sub|
    SendWeeklyUpdatesJob.perform_later(sub.chat_id)
  end
end

# Ping the website 2 times a day to stop fly.io from letting it go to sleep because the web instance is currently
# hosting the scheduler, and we need the scheduler to be running!
s.cron '0 0,12 * * *' do
  PingJob.perform_later("https://ruby.sg")
end
