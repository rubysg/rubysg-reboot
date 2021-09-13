# frozen_string_literal: true

class FeedbackForm
  include ActiveModel::Model

  class WrongQuestionFormatError < StandardError; end;

  class << self
    def model_name
      ActiveModel::Name.new(self, nil, 'Form')
    end

    private

    def title(title_name)
      class_eval %Q{
        def title
          "#{title_name}"
        end
      }
    end

    def questions(qns = [])
      qns.each do |qn|
        raise(WrongQuestionFormatError, "Question must contain key") unless qn.include?(:key)
        raise(WrongQuestionFormatError, "Question must contain question") unless qn.include?(:question)

        class_eval %Q{
          attr_accessor :#{qn[:key]}
          #{ qn[:required] == true ? "validates :#{qn[:key]}, presence: true" : "" }
        }
      end

      class_eval %Q{
        def questions
          #{qns}
        end
      }
    end
  end

  attr_reader :form_type

  title "Feedback Form"
  questions []

  def initialize(params = ActionController::Parameters.new)
    @form_type = self.class.name.demodulize
    super(params.permit(question_keys))
  end

  def submit
    return false unless valid?

    FormResponse.new({
      form_type: form_type,
      response: question_keys.each_with_object({}) { |key, obj| obj[key] = send(key) }
    }).save
  end

  private

  def question_keys
    questions.map { |q| q[:key] }
  end
end
