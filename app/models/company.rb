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
  #
  # *Do not worry about the order as `LIST` will be sorted alphabetically.*
  #
  # 1. Name of Company
  # 2. Website of Company
  # 3. Logo URL (max height 100px)
  #   - Tip: Issue a Pull Request on GitHub, add your logo to the PR's description and use the GitHub link.
  # 4. Address of Company
  #   - In the future, we might be able to map all companies onto a map!
  # 5. Hiring URL
  #   - If you are hiring, add the link to the JD, otherwise, set as `nil`.
  # 6. Email
  #   - A generic company email
  #
  # Notes:
  #
  # - Use single quotes
  # - Align hash values so that it's easier to scan
  #
  # After you are done, please run specs with `rspec`.
  #
  # There are basic specs that validate the integrity of constant `LIST`
  # and so if specs fail, please fix the errors before issuing a Pull Request.

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
      {
        name:       'Tinkerbox Studios',
        website:    'http://www.tinkerbox.com.sg',
        logo_url:   'https://cloud.githubusercontent.com/assets/5259935/10227563/a7f46946-68a0-11e5-9167-e0c6636e4329.png',
        address:    '113b Jalan Besar, Singapore 208833',
        hiring_url: nil,
        email:      'info@tinkerbox.com.sg'
      },
      {
        name:       'Ruckus Wireless',
        website:    'http://www.ruckuswireless.com',
        logo_url:   'https://cloud.githubusercontent.com/assets/761959/10227703/767c9568-68a1-11e5-9440-eaec3eb2e83d.jpeg',
        address:    '1 Fusionopolis View, #09-02 Sandcrawler, Singapore 138577',
        hiring_url: 'http://www.ruckuswireless.com/careers',
        email:      'info@ruckuswireless.com'
      },
      {
        name:       'HomeAway Asia',
        website:    'http://www.homeaway.asia',
        logo_url:   'https://cloud.githubusercontent.com/assets/1900876/10238424/27472246-68f2-11e5-9d23-bc5d2e2c71e5.png',
        address:    'Blk 71, Ayer Rajah Crescent, #01-20, Singapore 139951',
        hiring_url: nil,
        email:      'devel@homeaway.asia'
      }
    ]
end
