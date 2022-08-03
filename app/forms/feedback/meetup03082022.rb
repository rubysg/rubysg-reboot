# frozen_string_literal: true

module Feedback
  class Meetup03082022 < FeedbackForm
    title "August 2022 Meetup"

    questions [
      {
        key: :rating,
        question: "How would you rate today's meetup?",
        options: [1, 2, 3, 4, 5],
        required: true
      },
      {
        key: :feedback,
        question: "Any other feedback?"
      },
    ]
  end
end
