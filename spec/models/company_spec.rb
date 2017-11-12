require 'rails_helper'

RSpec.describe Company do
  context 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :website }
    it { is_expected.to validate_presence_of :logo_url }
    it { is_expected.to validate_presence_of :address }
    it { is_expected.to validate_presence_of :email }
  end

  describe '#all' do
    let(:company_a) { double(:company_a, name: 'abc', updated_on: '2016-01-01') }
    let(:company_b) { double(:company_b, name: 'xyz', updated_on: '2016-01-01') }
    let(:company_c) { double(:company_c, name: 'MNO', updated_on: '2017-01-01') }
    let(:company_d) { double(:company_d, name: 'MNO', updated_on: '2017-01-02') }

    it 'sorts by updated_on descending, then name ascending (ignore case)' do
      expect(RubysgReboot::COMPANIES).to receive(:map) { [company_a, company_b, company_c, company_d] }

      # stub 'company' test doubles to respond to :<=> method for custom sort
      allow(company_a).to receive(:<=>).with(company_b).and_return(-1)
      allow(company_a).to receive(:<=>).with(company_c).and_return(1)
      allow(company_a).to receive(:<=>).with(company_d).and_return(1)

      allow(company_b).to receive(:<=>).with(company_c).and_return(1)
      allow(company_b).to receive(:<=>).with(company_d).and_return(1)

      allow(company_c).to receive(:<=>).with(company_d).and_return(1)

      expect(Company.all).to eq [company_d, company_c, company_a, company_b]
    end
  end

  context 'validates company list' do
    it 'has valid companies' do
      Company.all.each do |company|
        expect(company).to be_valid, "#{company.name} is invalid: #{company.errors.full_messages}"
      end
    end
  end

  describe '#supporter?' do
    let(:company) { Company.new(contribution_count: contribution_count) }

    context 'with a supporting company' do
      let(:contribution_count) { 2 }

      it { expect(company.supporter?).to be_truthy }
    end

    context 'with a non-supporting company' do
      let(:contribution_count) { 0 }

      it { expect(company.supporter?).to be_falsey }
    end
  end
end
