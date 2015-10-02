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
      },
      {
        name:       'Roomorama',
        website:    'https://www.roomorama.com',
        logo_url:   'https://cloud.githubusercontent.com/assets/373453/10238847/b0b5f0de-68f7-11e5-85ab-068e40f6f2d8.jpg',
        address:    '115 Amoy Street, Singapore 069935',
        hiring_url: 'https://jobs.roomorama.com',
        email:      'careers@roomorama.com'
      },
      {
        name:       'The Cubiclerebels',
        website:    'http://cubiclerebels.com',
        logo_url:   'https://cloud.githubusercontent.com/assets/68039/10238934/9abe122e-68f8-11e5-9ba7-7cf95049324c.png',
        address:    '13 Lorong 24A Geylang, Singapore 398537',
        hiring_url: nil,
        email:      'team@cubiclerebels.com'
      },
      {
        name:       'ReferralCandy',
        website:    'http://www.referralcandy.com',
        logo_url:   'https://cloud.githubusercontent.com/assets/164703/10238307/6ab81ed8-68f0-11e5-8ac2-77520d02a639.png',
        address:    'Block 71 Ayer Rajah Crescent, #06-26, Singapore 139951',
        hiring_url: 'http://www.referralcandy.com/jobs',
        email:      'engineering+welcome@referralcandy.com'
      },
      {
        name:       'The Commissioned',
        website:    'https://www.thecommissioned.com/',
        logo_url:   'https://d1oatuxhb8j62x.cloudfront.net/assets/tc-logo-grey-7e18a18d4da188ed60abe6c96f2c2cee14a96d06ae4b91efd6c4bd16e21f484c.png',
        address:    '79 Ayer Rajah Crescent, #04-04, Singapore 139955',
        hiring_url: nil,
        email:      'hello@thecommissioned.com'
      },
      {
        name:       'Neo',
        website:    'http://neo.com/',
        logo_url:   'https://cloud.githubusercontent.com/assets/1477218/10240552/ed1df6e4-690f-11e5-9992-487f3a5ad7d6.png',
        address:    '53A Craig Road, Singapore 809691',
        hiring_url: nil,
        email:      'contact.sg@neo.com'
      },
      {
        name:       'Cantab IP',
        website:    'https://www.cantab-ip.com/',
        logo_url:   'https://www.cantab-ip.com/images/cantab-ip-logo-200.png',
        address:    'VBox 881846, Singapore 919191',
        hiring_url: nil,
        email:      'mail@cantab-ip.com'
      },
      {
        name:       'ESTL',
        website:    'https://github.com/moexmen',
        logo_url:   'https://cloud.githubusercontent.com/assets/4353853/10241116/308a4200-6917-11e5-822a-22ffef56f44f.png',
        address:    '285 Ghim Moh Road Singapore 279622',
        hiring_url: 'mailto:hello@estl.moe',
        email:      'hello@estl.moe'
      }
    ]
end
