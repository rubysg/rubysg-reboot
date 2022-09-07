module Feedback
  class Meetup07092022 < FeedbackForm
    title "September 2022 Meetup"

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
