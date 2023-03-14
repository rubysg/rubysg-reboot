require 'rails_helper'

RSpec.describe ApplicationJob, type: :job do
  subject { ApplicationJob.new }

  describe "#inline_retry_on" do
    it "retries for at most the number of times specified" do
      expected_num_of_retries = 5
      num_of_attempts = 0

      begin
        subject.inline_retry_on(retry_count: expected_num_of_retries) do |index|
          num_of_attempts += 1
          raise StandardError, "Something went wrong. Please try again."
        end
      rescue StandardError
      end

      actual_num_of_retries = num_of_attempts - 1
      expect(actual_num_of_retries).to eq (expected_num_of_retries)
    end

    it "re-raises error if the last retry still fails" do
      expect {
        subject.inline_retry_on(retry_count: 5) do |index|
          raise StandardError, "Something went wrong. Please try again."
        end
      }.to raise_error(StandardError, "Something went wrong. Please try again.")
    end

    it "does not retry if the block succeeds without throwing any error" do
      expected_num_of_retries = 3
      num_of_attempts = 0

      begin
        subject.inline_retry_on(retry_count: expected_num_of_retries + 2) do |index|
          num_of_attempts += 1

          if index < expected_num_of_retries
            raise StandardError, "Something went wrong. Please try again."
          end
        end
      rescue StandardError
      end

      total_num_of_retries = num_of_attempts - 1
      expect(total_num_of_retries).to eq (expected_num_of_retries)
    end
  end
end
