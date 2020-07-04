require 'rails_helper'
require 'frozen_record/test_helper'

RSpec.describe Company do
  it "validate companies.yml" do
    Company.all.each do |c|
      expect(c.name).to be_truthy
      expect(c.website).to be_truthy
      expect(c.logo_url).to be_truthy
      expect(c.address).to be_truthy
      expect(c.hiring_url).to be_truthy
      expect(c.email).to be_truthy
      expect(c.updated_on).to be_truthy
      expect(c.contribution_count).to be_truthy
    end
  end

  context "test data" do
    before do
      FrozenRecord::TestHelper.load_fixture(
        Company,
        Rails.root.join("spec", "fixtures", "files")
      )
    end

    describe '#sorted' do
      it '#sorted, returns companies sorted by updated_on desc, then name asc (ignore case)' do
        companies = Company.sorted
        expect(companies[0].name).to eq "DCompany"
        expect(companies[1].name).to eq "BCompany"
        expect(companies[2].name).to eq "CCompany"
        expect(companies[3].name).to eq "ACompany"
      end
    end

    describe '#supporter?' do
      it "true when contribution_count is > 0" do
        company = Company.new(contribution_count: 1)
        expect(company.supporter?).to eq true
      end

      it "false when contribution_count is = 0" do
        company = Company.new(contribution_count: 0)
        expect(company.supporter?).to eq false
      end
    end

    describe '#supporters' do
      let(:companies) { Company.supporters }

      it "list of companies that has contribution_count >= 1" do
        companies.each do |c|
          expect(c.contribution_count).to be >= 1
        end
      end

      it "companies are sorted by contribution_count :desc, then updated_on :desc" do
        expect(companies[0].name).to eq "CCompany"
        expect(companies[1].name).to eq "DCompany"
        expect(companies[2].name).to eq "BCompany"
      end
    end

    describe '#non_supporters' do
      it "list of companies that has contribution_count < 1" do
        Company.non_supporters.each do |c|
          expect(c.contribution_count).to be < 1
        end
      end
    end
  end
end
