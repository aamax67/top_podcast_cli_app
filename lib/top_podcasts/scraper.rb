class TopPodcasts::Scraper

  def get_page
    Nokogiri::HTML(open("http://toppodcast.com/top-200-podcast/"))
  end

  def get_podcasts
    self.get_page.css(".podcastRow")
  end

  def make_podcasts
    self.get_podcasts.each do |p|
    TopPodcasts::Podcast.new_from_index_page(p)
    end
  end
end
