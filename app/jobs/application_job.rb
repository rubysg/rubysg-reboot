class ApplicationJob < ActiveJob::Base

  # I am implementing a retry mechanism for inline jobs because `retry_on`
  # is not supported when queue adapter is :inline. This is the error
  # message that I received when testing `retry_on` using :inline queue
  # adapter:
  #   Failed enqueuing TestJob to Inline(default): NotImplementedError
  #   (Use a queueing backend to enqueue jobs in the future. Read more
  #   at https://guides.rubyonrails.org/active_job_basics.html)
  def inline_retry_on(retry_count:)
    max_number_of_attempts = 1 + retry_count
    num_of_attempt = 0
    success = false

    while !success && num_of_attempt < max_number_of_attempts
      begin
        Rails.logger.debug "[#{self.class.name}] inline_retry_on index: #{num_of_attempt}"

        yield(num_of_attempt)

        success = true
      rescue StandardError => e
        num_of_attempt += 1

        Rails.logger.debug e.full_message

        no_more_attempts = (num_of_attempt == max_number_of_attempts)
        raise e if no_more_attempts
      end
    end
  end
end
