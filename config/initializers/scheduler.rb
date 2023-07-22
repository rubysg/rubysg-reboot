require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

return if defined?(Rails::Console) || Rails.env.test? || File.split($0).last == 'rake'

# Send weekly news updates on Friday 5:30pm
s.cron '30 17 * * 5' do
  RubySgBotSubscriber.in_batches.each_record do |sub|
    SendWeeklyUpdatesJob.perform_later(sub.chat_id)
  end
end
