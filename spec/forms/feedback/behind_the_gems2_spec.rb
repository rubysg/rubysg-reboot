require "rails_helper"

RSpec.describe Feedback::BehindTheGems2 do
  subject { Feedback::BehindTheGems2.new }

  it "#title returns correct title" do
    expect(subject.title).to eq "Behind the Gems 2 :: 6"
  end

  it "#questions return list of questions" do
    expect(subject.questions.count).to eq 2
    expect(subject.questions.first).to eq({
      key: :rating,
      question: "How would you rate today's meetup?",
      options: [1, 2, 3, 4, 5],
      required: true
    })
    expect(subject.questions.second).to eq({
      key: :feedback,
      question: "Any other feedback?"
    })
  end

  it "#submit return false if there are missing answers" do
    expect(subject.submit).to eq false
  end

  it "#submit does not create a FormResponse if not all required answers are provided" do
    expect {
      subject.submit
    }.to change { FormResponse.count }.by(0)
  end

  it "#submit return true if all required answers are provided" do
    expect(
      Feedback::BehindTheGems2.new(ActionController::Parameters.new({ rating: 1 })).submit
    ).to eq true
  end

  it "#submit creates a FormResponse if all required answers are provided" do
    form = Feedback::BehindTheGems2.new(ActionController::Parameters.new({ rating: 1 }))

    expect { form.submit }.to change { FormResponse.count }.by(1)
    expect(FormResponse.last.form_type).to eq form.form_type
    expect(FormResponse.last.response).to eq({ "rating" => 1, "feedback" => nil })
  end
end
