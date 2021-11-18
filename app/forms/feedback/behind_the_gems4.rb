# frozen_string_literal: true

module Feedback
  class BehindTheGems4 < FeedbackForm
    title "Behind the Gems 4 :: 6"

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
