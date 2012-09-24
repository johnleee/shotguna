class FeedEntry < ActiveRecord::Base
  attr_accessible :guid, :name, :published_at, :summary, :url


  ##FeedEntry.update_from_feed("http://asciicasts.com/episodes.xml")
  ##http://stackoverflow.com/questions/4092706/feedzirra-with-multiple-feeds

  def self.get_feeds
    feed_urls = %w(http://www.runnersworld.com/rss/dnrss.xml/1,6910,,00.xml http://feeds.feedburner.com/Runblogger?format=xml)
    update_from_feeds(feed_urls)
  end

  def self.update_from_feeds(feed_urls)
    feeds = Feedzirra::Feed.fetch_and_parse(feed_urls)
    feeds.each do |feed_url, feed|
      add_entries(feed.entries)
    end
  end

  def self.update_from_feeds_continuously(feed_urls, delay_interval = 120.seconds)
    feeds = Feedzirra::Feed.fetch_and_parse(feed_urls)
    add_entries(feeds.entries)
    loop do
      sleep delay_interval
      feeds = Feedzirra::Feed.update(feeds.entries)
      add_entries(feeds.new_entries) if feeds.updated?
    end
  end

  private

    def self.add_entries(entries)
    entries.each do |entry|
      unless exists? :guid => entry.id
        create!(
            :name         => entry.title,
            :summary      => entry.summary,
            :url          => entry.url,
            :published_at => entry.published,
            :guid         => entry.id
        )
      end
    end
  end


  #def self.update_from_feed(feed_url)
  #  feed = Feedzirra::Feed.fetch_and_parse(feed_url)
  #  feed.entries.each do |entry|
  #    unless exists? :guid => entry.id
  #      create!(
  #          :name         => entry.title,
  #          :summary      => entry.summary,
  #          :url          => entry.url,
  #          :published_at => entry.published,
  #          :guid         => entry.id
  #      )
  #    end
  #  end
  #end
end
