class Invitation
  include ActiveModel::Model
  include ActiveModel::Validations

  include HTTParty
  base_uri "https://#{ENV['SLACK_TEAM']}.slack.com"

  attr_accessor :email

  validates_presence_of :email

  def create_and_send
    return unless valid?

    options = {
      body: {
        email:      @email,
        channels:   ENV['SLACK_CHANNELS'],
        token:      ENV['SLACK_TOKEN'],
        set_active: 'true',
        _attempts:  1
      }
    }

    response = self.class.post("/api/users.admin.invite?t=#{Time.now.to_i}", options)
    if response['ok']
      true
    else
      errors.add(:email, "Slack Error: #{response['error']}")
      false
    end
  end
end
