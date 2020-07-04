class Company < FrozenRecord::Base
  scope :sorted, -> { all.order(updated_on: :desc, name: :asc, contribution_count: :desc) }

  def supporter?
    contribution_count.to_i >= 1
  end

  def self.supporters
    sorted
      .select(&:supporter?)
      .sort_by do |company|
        [
          -company.contribution_count,
          Date.today - Date.strptime(company.updated_on, "%Y-%m-%d")
        ]
      end
  end

  def self.non_supporters
    sorted
      .reject(&:supporter?)
  end
end
