class TopPodcasts::Podcast
  attr_accessor :name, :rank, :url, :summary

    @@all = []

    def self.today
      self.scrape_podcasts
    end

    def initialize(name = nil, rank = nil, url = nil)
      @name = name
      @rank = rank
      @url = url
      @summary = summary
    end

    def self.all

      podcasts << self.scrape_podcasts
      @@all << podcasts
    end

    def self.find(id)
      self.all[id-1]
    end

  def self.scrape_podcasts
    podcasts = []
    doc = Nokogiri::HTML(open("http://toppodcast.com/top-200-podcast/"))
    podcast = self.new
    podcast.name = doc.search(".podcastRow").css("h3").text.gsub(/\t/, '').strip
    podcast.rank = doc.search(".podcastRow").css(".numberImage").text.gsub(/\t/, '').strip
    podcast.summary = doc.search(".podcastRow").css("p").text.strip
    podcast.url = doc.search("a.view_show").first.attr("href")
    podcasts
  end
end
