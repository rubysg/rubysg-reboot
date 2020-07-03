class RubyWeekly
  RSS_FEED_URL = "https://rubyweekly.com/rss/"

  def title
    latest_feed["title"]
  end

  def issue_link
    latest_feed["link"]
  end

  def featured_articles
    doc = Nokogiri::HTML(latest_feed["description"])
    contents = doc.search('/html/body/table/tr/td/div/table')

    jobs_section_index = 0
    contents.each_with_index do |table, index|
      if table.search('tr/td/p')&.first&.text&.downcase&.match?(/jobs$/)
        jobs_section_index = index
        break
      end
    end

    featured_articles = contents.first(jobs_section_index).map do |table|
      link = table.search('tr/td/p/span/a')&.first&.attributes&.[]("href")&.value.to_s
      title = table.search('tr/td/p/span/a')&.first&.children&.first&.to_s
      subtitle = table.search('tr/td/p')&.first&.text.to_s

      if link.present? && title.present? && subtitle.present?
        {
          link: link,
          title: title,
          subtitle: subtitle
        }
      else
        nil
      end
    end.compact

    featured_articles
  end

  def latest_feed
    @latest_feed ||= HTTParty.get(RSS_FEED_URL)["rss"]["channel"]["item"].first
  end
end
