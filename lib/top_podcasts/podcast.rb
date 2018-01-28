class TopPodcasts::Podcast
  attr_accessor :name, :rank, :url, :summary

    @@all = []

    def initialize(name = nil, rank = nil, url = nil)
      @name = name
      @rank = rank
      @url = url
      @summary = summary

    end

    def self.all
      @@all << self.scrape_podcast
    end

    def self.find(id)
      self.all[id-1]
    end

  def self.scrape_podcast

    doc = Nokogiri::HTML(open("http://toppodcast.com/top-200-podcast/"))

    podcast = self.new
    podcast.name = doc.search(".podcastRow").first.css("h3").text.strip
    podcast.rank = doc.search(".podcastRow").first.css(".numberImage").text.strip
    podcast.summary = doc.search(".podcastRow").first.css("p").text.strip
    podcast.url = doc.search("a.view_show").first.attr("href")
    podcast
  end
end
