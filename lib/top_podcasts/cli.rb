class TopPodcasts::CLI

  def call
    TopPodcasts::Scraper.new.make_podcasts
    puts "Welcome to the top 50 podcasts:"
    start
  end

  def start
    puts ""
    puts "What number podcasts would you like to see? 1-10, 11-20, 21-30, 31-40 or 41-50?"
    input = gets.strip.to_i

    print_podcasts(input)

    puts ""
    puts "What podcast would you like more information on?"
    input = gets.strip

    podcast = TopPodcasts::Podcast.find(input.to_i)

    print_podcast(podcast)

    puts ""
    puts "Would you like to see another podcast? Enter Y or N"

    input = gets.strip.downcase
      if input == "y"
          start
      else
        puts ""
        puts "Thankyou! Have a great day!"
        exit
      end
    end


  def print_podcast(podcast)
    puts ""
    puts "----------- #{podcast.rank} - #{podcast.name} -----------"
    puts ""
    puts "----------------------------Summary---------------------------"
    puts ""
    puts "#{podcast.summary}"
    puts ""
  end

  def print_podcasts(from_number)
    puts ""
    puts "---------- Podcasts #{from_number} - #{from_number+9} ----------"
    puts ""
    TopPodcasts::Podcast.all[from_number-1, 10].each.with_index(from_number) do |podcast, index|
      puts "#{podcast.rank} - #{podcast.name}"
    end
  end
end
