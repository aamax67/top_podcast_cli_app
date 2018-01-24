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
    puts "--------- Top 200 Podcasts ---------"
    puts <<-DOC
    1.  This American Life
    2.  The Moth
    DOC

    @podcast = TopPodcasts::Podcast.today
  end

  def menu
    puts "Enter the number of the podcast you would like more info on or type list to return to list. Or type exit to terminate."
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on podcast 1"
      when "2"
        puts "More info on podcast 2"
      when "list"
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
