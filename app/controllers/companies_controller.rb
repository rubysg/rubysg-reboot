class CompaniesController < ApplicationController
  def index
    companies = Company.all
    @supporter_companies = companies.select(&:supporter?).sort_by.with_index { |company, i| [-company.contribution_count, i] }
    @other_companies = companies - @supporter_companies
  end
end
