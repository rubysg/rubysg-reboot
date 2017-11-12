class Company
  include ActiveModel::Model

  attr_accessor(
    :name,
    :website,
    :logo_url,
    :address,
    :hiring_url,
    :email,
    :updated_at,
    :contribution_count
  )

  validates_presence_of(
    :name,
    :website,
    :logo_url,
    :address,
    :email,
    :updated_at
  )

  def supporter?
    contribution_count.to_i >= 1
  end

  def <=>(other)
    # sort by most recently updated, then by ascending company name
    return 1  if Date.parse(self.updated_at) < Date.parse(other.updated_at)
    return -1 if Date.parse(self.updated_at) > Date.parse(other.updated_at)
    self.name.downcase <=> other.name.downcase
  end

  def self.all
    RubysgReboot::COMPANIES.map { |company| Company.new(company) }.sort
  end
end
