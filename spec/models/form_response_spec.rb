require 'rails_helper'

RSpec.describe FormResponse, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :form_type }
    it { is_expected.to validate_presence_of :response }
  end
end
