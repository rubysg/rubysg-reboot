require "rails_helper"

RSpec.describe RubyWeekly do
  before do
    allow(HTTParty)
    .to(receive(:get))
    .and_return(JSON.parse(file_fixture("ruby_weekly_rss.json").read))
  end

  describe "#title" do
    it "returns the title of the latest RubyWeekly issue" do
      expect(subject.title).to eq "A proposed new syntax for struct literals"
    end
  end

  describe "#issue_link" do
    it "returns direct link to the latest RubyWeekly issue" do
      expect(subject.issue_link).to eq "https://rubyweekly.com/issues/508"
    end
  end

  describe "#featured_articles" do
    it "returns an array of featured articles" do
      expect(subject.featured_articles.class).to eq Array

      subject.featured_articles.each do |item|
        expect(item.class).to eq Hash
        expect(item.keys).to include(:link)
        expect(item.keys).to include(:title)
        expect(item.keys).to include(:subtitle)
      end
    end
  end
end
