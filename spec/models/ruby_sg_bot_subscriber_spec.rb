require 'rails_helper'

RSpec.describe RubySgBotSubscriber, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :chat_id }
  end
end
