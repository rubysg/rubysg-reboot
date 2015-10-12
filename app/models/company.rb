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
        logo_url:   'https://cloud.githubusercontent.com/assets/761959/10251882/860e1cca-6966-11e5-9f25-3402a189a7f9.png',
        address:    '1 Fusionopolis View, #09-02 Sandcrawler, Singapore 138577',
        hiring_url: 'http://www.ruckuswireless.com/careers',
        email:      'info@ruckuswireless.com'
      },
      {
        name:       'HomeAway Asia',
        website:    'http://www.homeaway.asia',
        logo_url:   'https://cloud.githubusercontent.com/assets/1900876/10238424/27472246-68f2-11e5-9d23-bc5d2e2c71e5.png',
        address:    'Blk 71, Ayer Rajah Crescent, #01-20, Singapore 139951',
        hiring_url: 'mailto:jobs@homeaway.asia',
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
        address:    '53 Craig Road, #02-00, Singapore 809691',
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
      },
      {
        name:       'TradeGecko',
        website:    'https://www.tradegecko.com',
        logo_url:   'https://cloud.githubusercontent.com/assets/701246/10245604/a935a360-693b-11e5-83b0-f61ce1894330.png',
        address:    '121 Telok Ayer St, 068590',
        hiring_url: 'https://www.tradegecko.com/jobs',
        email:      'hello@tradegecko.com'
      },
      {
        name:       'Viki',
        website:    'https://www.viki.com/',
        logo_url:   'https://cloud.githubusercontent.com/assets/2296/10248847/b75b58fe-6954-11e5-8b27-d9000f8febc3.png',
        address:    '138 Market Street, #32-01 CapitaGreen, Singapore 048946',
        hiring_url: 'https://www.viki.com/jobs',
        email:      'engineering@viki.com'
      },
      {
        name:       'ShopVenture',
        website:    'https://www.shopventure.com/',
        logo_url:   'https://avatars0.githubusercontent.com/u/9315550?v=3&s=100',
        address:    '101C Telok Ayer Street, #04-00 Singapore 068574',
        email:      'allen@shopventure.com'
      },
      {
        name:       'GrabTaxi',
        website:    'https://www.grabtaxi.com/',
        logo_url:   'https://cloud.githubusercontent.com/assets/3825824/10251326/76338ac8-6962-11e5-8761-3fd931f9e740.png',
        address:    '28 Sin Ming Lane, #01-143 Midview city, Singapore 573972',
        hiring_url: 'https://grab.careers/',
        email:      'careers@grabtaxi.com'
      },
      {
        name:       'Beanstack',
        website:    'http://www.beanstack.sg/',
        logo_url:   'https://cloud.githubusercontent.com/assets/2155919/10252808/6c157ed4-696c-11e5-9000-8c7809209276.png',
        address:    '2 Bukit Batok St 24 #04-05 Singapore 659480',
        hiring_url: nil,
        email:      'hello@beanstack.sg'
      },
      {
        name:       'Rubify Technology',
        website:    'http://www.rubify.com/',
        logo_url:   'https://cloud.githubusercontent.com/assets/29207/10266530/caa3c7bc-6a9d-11e5-9f9f-7b3ed0d3d0ff.png',
        address:    '300 Tampines Avenue 5, #09-02 Singapore 529653',
        hiring_url: nil,
        email:      'hello@rubify.com'
      },
      {
        name:       'Flowhero Labs',
        website:    'http://www.flowhero.io/',
        logo_url:   'https://cloud.githubusercontent.com/assets/297375/10273239/ddb007a4-6b5f-11e5-8bbf-204032afba4d.png',
        address:    '8 Burn Road, #15-13 Trivex, Singapore 369977',
        hiring_url: nil,
        email:      'hello@flowhero.io'
      },
      {
        name:       'GDS @ Hive',
        website:    'https://github.com/idagds',
        logo_url:   'https://cloud.githubusercontent.com/assets/1000669/10274777/c94e7318-6b73-11e5-869a-fb6eb4ad807f.jpg',
        address:    'Sandcrawler, 1 Fusionopolis View, #08-01, Singapore 138577',
        hiring_url: 'mailto:hiring@ida-gds.com',
        email:      'hiring@ida-gds.com'
      },
      {
        name:       'ThoughtWorks',
        website:    'http://www.thoughtworks.com',
        logo_url:   'http://www.thoughtworks.com/imgs/tw-logo.png',
        address:    '87B Amoy Street, Singapore 069906',
        hiring_url: 'https://www.thoughtworks.com/careers',
        email:      'join-sg@thoughtworks.com'
      },
      {
        name:       'NCS Pte Ltd',
        website:    'http://ncs.com.sg/',
        logo_url:   'http://info.singtel.com/sites/default/files/about-us/NCS.png',
        address:    '5 Ang Mo Kio Street 62. NCS Hub Singapore 569141',
        hiring_url: 'http://surfnation.net/',
        email:      'agilepractice@ncs.com.sg'
      },
      {
        name:       'Aureso',
        website:    'http://www.aureso.com',
        logo_url:   'http://aureso.com/assets/img/Logo@2x.png',
        address:    '59 Kampong Bahru Road, #02-03, Singapore 169367',
        hiring_url: 'http://www.aureso.com/career',
        email:      'team@aureso.com'
      },
      {
        name:       'Futureworkz',
        website:    'http://www.futureworkz.com',
        logo_url:   'https://s3-ap-southeast-1.amazonaws.com/futureworkz/3rd-party/logo.png',
        address:    '3 Fusionopolis Place #03-55 Singapore 138523',
        hiring_url: nil,
        email:      'hello@futureworkz.com'
      },
      {
        name:       'Luxola',
        website:    'http://www.luxola.com',
        logo_url:   'http://s0.luxola.com/assets/lx_logo_v4-67a12b178642e18c0cbad1f51a01b600.png',
        address:    '217 Henderson Road, #01-10, Singapore 159555',
        hiring_url: 'http://www.luxola.com/jobs',
        email:      'contact@luxola.com'
      },
      {
        name:       'ProperHands',
        website:    'http://www.properhands.com',
        logo_url:   'http://properhands.com/assets/properhands-logo.png',
        address:    '261 Waterloo St, #03-32, Waterloo Centre, Singapore 180261',
        hiring_url: 'http://www.startupjobs.asia/company/2085-properhands-singapore',
        email:      'contact@properhands.com'
      },
      {
        name:       'Ricoh Singapore',
        website:    'http://www.ricoh.sg/',
        logo_url:   'https://cloud.githubusercontent.com/assets/413879/10420511/2d39c36a-70c8-11e5-8938-e7929ce345f4.gif',
        address:    '20W Pasir Panjang Road #04-28 Mapletree Business City Singapore 117439',
        hiring_url: nil,
        email:      'rspapps@ricoh.sg'
      }
    ]
end
