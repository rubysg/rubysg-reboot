require 'rails_helper'

RSpec.describe SendWeeklyUpdatesJob, type: :job do
  include ActiveJob::TestHelper

  it "enqueues a job" do
    expect { SendWeeklyUpdatesJob.perform_later("1") }.to have_enqueued_job
  end

  it "retry_on StandardError" do
    expect_any_instance_of(SendWeeklyUpdatesJob).to receive(:perform).and_raise(StandardError)

    perform_enqueued_jobs do
      expect_any_instance_of(SendWeeklyUpdatesJob)
        .to receive(:retry_job)

      SendWeeklyUpdatesJob.perform_later("1")
    end
  end

  it "sends failure notification when all retries are exhausted" do
    stub_request(:post, "https://bobops.net/api/incoming_webhook")
      .with(
        body: {
          "text": <<~ERROR_MESSAGE
            ActiveRecord::RecordNotFound@SendWeeklyUpdatesJob
            Couldn't find RubySgBotSubscriber
          ERROR_MESSAGE
        }.to_json,
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type'=>'application/json',
          'User-Agent'=>'Ruby'
        }
      )
      .to_return(status: 200, body: "", headers: {})

    assert_performed_jobs 3 do
      SendWeeklyUpdatesJob.perform_later("1")
    end
  end
end
