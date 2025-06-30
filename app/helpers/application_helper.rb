# frozen_string_literal: true

module ApplicationHelper
  def rubysg_telegram_qr_code_svg
    RQRCode::QRCode
      .new(rubysg_telegram_link)
      .as_svg(
        offset: 10,
        color: '222529',
        shape_rendering: 'crispEdges',
        module_size: 6,
        standalone: true
      ).html_safe
  end

  def rubysg_telegram_link
    "https://t.me/+2SjusiYG07pjYWE1"
  end

  def rubysg_meetup_com_link
    "http://www.meetup.com/Singapore-Ruby-Group"
  end

  def rubysg_engineerssg_link
    "https://engineers.sg/organization/rubysg--57"
  end

  def rubysg_github_guide_link
    "https://github.com/rubysg/singapore"
  end

  def rubysg_photo_album_link
    "https://www.icloud.com/sharedalbum/#B0SJtdOXmmrrha"
  end
end
