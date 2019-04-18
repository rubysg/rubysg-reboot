class CompaniesController < ApplicationController
  def index
    @supporter_companies = Company.fetch_supporters
    @other_companies = Company.fetch_non_supporters
  end
end
