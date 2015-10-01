class Company
  include ActiveModel::Model

  attr_accessor(
    :name,
    :website,
    :logo_url,
    :address,
    :hiring_url,
    :email
  )

  validates_presence_of(
    :name,
    :website,
    :logo_url,
    :address,
    :email
  )

  def self.all
    LIST.map { |company| Company.new(company) }.sort_by {|company| company.name.downcase }
  end

  # Update the constant `LIST` with your company details.
  # Do not worry about the position as the list will be sorted alphabetically.
  #
  # 1. Name of Company
  # 2. Logo URL
  #   - Issue a Pull Request on GitHub, add your logo to the PR's description and use the GitHub link)
  # 3. Nature of Company
  #   - Needs to be one of these: ['Consultancy', 'Product', 'Freelancer']
  # 4. Address of Company
  #   - In the future, we might be able to map all companies onto the map!
  # 5. Hiring URL
  #   - If you are hiring, add the link to the JD, otherwise, keep it nil.
  # 6. Email
  #   - A generic company email
  #
  # Notes:
  # - Use single quotes
  # - Align hash values so that it's easier to scan
  #
  # Thank you!

  LIST =
    [
      {
        name:       'Jolly Good Code',
        website:    'http://www.jollygoodcode.com',
        logo_url:   'https://cloud.githubusercontent.com/assets/1000669/9362336/72f9c406-46d2-11e5-94de-5060e83fcf83.jpg',
        address:    '128 Prinsep Street, Singapore 188655',
        hiring_url: nil,
        email:      'hello@jollygoodcode.com'
      },
    ]
end
