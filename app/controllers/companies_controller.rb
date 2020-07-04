class CompaniesController < ApplicationController
  def index
    @supporter_companies = Company.supporters
    @other_companies = Company.non_supporters
  end
end
