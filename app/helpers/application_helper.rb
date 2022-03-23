module ApplicationHelper
  def rubysg_telegram_qr_code_svg
    RQRCode::QRCode
      .new("https://t.me/joinchat/TWJ3HtLeJF81EweA")
      .as_svg(
        offset: 10,
        color: '222529',
        shape_rendering: 'crispEdges',
        module_size: 6,
        standalone: true
      ).html_safe
  end
end
