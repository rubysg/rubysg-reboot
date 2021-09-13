class FormResponse < ApplicationRecord
  validates :form_type, presence: true
  validates :response, presence: true
end
