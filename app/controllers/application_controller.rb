class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    begin
      @events = JSON.parse(Curl.get("https://api.meetup.com/2/events?key=#{Rails.application.secrets.meetup_api_key}&group_urlname=Singapore-Ruby-Group&sign=true").body_str)
    rescue
    end
  end
end
