require "rails_helper"

RSpec.describe FeedbackForm do
  subject { FeedbackForm.new }
  let(:class_object) { subject.class }
  let(:dummy_questions) do
    [
      {
        key: :rating,
        question: "How would you rate this form?",
        required: true,
      },
      {
        key: :feedback,
        question: "Any other feedback?",
      }
    ]
  end

  it "#title returns default title" do
    expect(subject.title).to eq "Feedback Form"
  end

  it "#questions return empty array" do
    expect(subject.questions).to eq []
  end

  it "#form_type is the class name without namespace" do
    expect(subject.form_type).to eq "FeedbackForm"
    expect(Feedback::BehindTheGems2.new.form_type).to eq "BehindTheGems2"
  end

  describe "Meta programming methods" do
    after(:each) do
      class_object.send(:title, "Feedback Form")
      class_object.send(:questions, [])
    end

    it ".title overrides #title for form" do
      class_object.send(:title, "A dummy form")

      expect(subject.title).to eq "A dummy form"
    end

    it ".questions overrides #questions for form" do
      class_object.send(:questions, dummy_questions)

      expect(subject.questions).to be_an(Array)
      expect(subject.questions.first).to eq({ key: :rating, question: "How would you rate this form?", required: true })
      expect(subject.questions.second).to eq({ key: :feedback, question: "Any other feedback?" })
    end

    it ".questions set attr_accessor for each key in questions list" do
      class_object.send(:questions, dummy_questions)

      subject.rating = 10
      expect(subject.rating).to eq 10

      subject.feedback = "This is a great form!"
      expect(subject.feedback).to eq "This is a great form!"
    end

    it ".questions set presence validator for each required key in questions list" do
      class_object.send(:questions, dummy_questions)

      subject.rating = nil
      subject.feedback = nil
      subject.valid?

      expect(subject.errors.to_hash).to include(:rating)
      expect(subject.errors.to_hash).not_to include(:feedback)
    end

    it ".questions does not set presence validator for non-required key in questions list" do
      class_object.send(:questions, dummy_questions)

      subject.rating = 1
      subject.feedback = nil
      subject.valid?

      expect(subject.errors.to_hash).not_to include(:rating)
      expect(subject.errors.to_hash).not_to include(:feedback)
    end

    it ".questions raises WrongQuestionFormatError if any question is missing key" do
      expect {
        FeedbackForm.send(:questions, [{ irrelevant_key: "irrelevant value" }])
      }.to raise_error FeedbackForm::WrongQuestionFormatError
    end

    it ".questions raises WrongQuestionFormatError if any question is missing question" do
      expect {
        FeedbackForm.send(:questions, [{ key: "key" }])
      }.to raise_error FeedbackForm::WrongQuestionFormatError
    end
  end
end
