
class Cli
  def search_for
    search =""
    puts "Welcome to Top25!"
    puts "================="
    puts "What would you like to search for?"
    puts "1. Hotels\n2. Restaurants\n3. Beaches"
    search = gets.strip
    case search.downcase
    when "1"
        make_places("Hotels")
        display_places
      when "2"
        make_places("Restaurants")
        display_places
      when "3"
        make_places("Beaches")
        display_places
      else
        puts "sorry, you only can search hotels,restaurants and beaches"
      end
  end

  def make_places(name)
    arrofplaces = Scraper.scrap(name)
    Place.create_from_collection(arrofplaces)
  end

  def display_places
    Place.all.each do |pl|
      puts "#{pl.num}. #{pl.name}-based in: #{pl.location}"
    end
     puts "----------------------".colorize(:green)
  end
end
