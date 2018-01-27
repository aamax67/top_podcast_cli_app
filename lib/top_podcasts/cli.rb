class TopPodcasts::CLI

  def call
    puts "Welcome to the top 200 podcasts:"
    puts ""
    list_podcasts
    puts ""
    menu
    goodbye
  end

  def list_podcasts
    @podcasts = TopPodcasts::Podcast.today
    @podcasts.each.with_index(1) do |podcast, i|
      puts "#{podcast.rank}.   #{podcast.name}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the podcast you would like more info on or type list to return to list. Or type exit to terminate."
      input = gets.strip.downcase

      if input.to_i > 0
        the_podcast = @podcasts[input.to_i-1]
        puts "#{podcast.rank}.   #{podcast.name}"
      elsif input == "list"
        list_podcasts
      else
        puts "Not sure what you are trying to do. Please type list to see podcasts or exit to terminate."
      end
    end
  end

  def goodbye
    puts "Come back anytime to find your favorite podcast!"
  end
end
