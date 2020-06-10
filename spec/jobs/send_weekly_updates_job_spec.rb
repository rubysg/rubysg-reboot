require 'rails_helper'

RSpec.describe SendWeeklyUpdatesJob, type: :job do
  it "enqueues a job" do
    expect { SendWeeklyUpdatesJob.perform_later("1") }.to have_enqueued_job
  end
end
