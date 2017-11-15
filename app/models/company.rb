class Company
  include ActiveModel::Model

  attr_accessor(
    :name,
    :website,
    :logo_url,
    :address,
    :hiring_url,
    :email,
    :updated_on,
    :contribution_count
  )

  validates_presence_of(
    :name,
    :website,
    :logo_url,
    :address,
    :email,
    :updated_on
  )

  def supporter?
    contribution_count.to_i >= 1
  end

  def self.fetch_supporters
    self.all.select(&:supporter?).sort_by.with_index { |company, i| [-company.contribution_count, i] }
  end

  def self.fetch_non_supporters
    self.all.reject(&:supporter?)
  end

  def <=>(other)
    # sort by most recently updated, then by ascending company name
    return 1  if Date.parse(self.updated_on) < Date.parse(other.updated_on)
    return -1 if Date.parse(self.updated_on) > Date.parse(other.updated_on)
    self.name.downcase <=> other.name.downcase
  end

  def self.all
    RubysgReboot::COMPANIES.map { |company| Company.new(company) }.sort
  end
end
