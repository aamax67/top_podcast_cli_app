class TopPodcasts::CLI

  def call
    puts "Welcome to the top 200 podcasts:"
    start
    puts ""
    menu
    goodbye
  end

  def start
    puts ""
    puts "What number podcasts would you like to see? 1-50, 51-100, 101-150 or 151-200?"
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
    puts "---------- Podcasts #{from_number} - #{from_number+49} ----------"
    puts ""
    TopPodcasts::Podcast.all[from_number-1, 50].each.with_index(from_number) do |podcast, index|
      puts "#{index}. #{podcast.title}"
    end
  end
end
