class TopPodcasts::Podcast
  attr_accessor :name, :rank, :summary

    @@all = []

    def self.new_from_index_page(p)
    self.new(
      p.css("h3").text.gsub(/\t/, '').strip,
      p.css(".numberImage").text.gsub(/\t/, '').strip,
      p.css("p").text.strip
      )
  end

  def initialize(name = nil, rank = nil, summary = nil)
    @name = name
    @rank = rank
    @summary = summary
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end
end
