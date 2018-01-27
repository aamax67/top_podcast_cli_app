class TopPodcasts::Podcast
  attr_accessor :name, :rank, :url

  def self.today
    # scrape toppodcast.com and return podcasts based on that data

    podcast_1 = self.new
    podcast_1.name = "This American Life"
    podcast_1.rank = "1"
    podcast_1.url = "http://toppodcast.com/podcast_feeds/this-american-life-this-american-life/"

    podcast_2 = self.new
    podcast_2.name = "The Moth"
    podcast_2.rank = "2"
    podcast_2.url = "http://toppodcast.com/podcast_feeds/the-moth/"

    [podcast_1, podcast_2]
  end
end
