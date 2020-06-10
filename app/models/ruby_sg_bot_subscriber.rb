class RubySgBotSubscriber < ApplicationRecord
  validates :chat_id, presence: true
end
