
class Top25::Cli

  def search_for
    search =""
    puts "Search for the best in the world, choose on of the follwing number"
    puts "1. Hotels\n2. Restaurants\n3. Beaches"
    search = gets.strip
    case search
    when "1"
        run("Hotels")
      when "2"
        run("Restaurants")
      when "3"
        run("Beaches")
      else
        puts "sorry, you only can search hotels,restaurants and beaches"
      end

      choose =""
      puts "choose one to get more information about it"
      choose = gets.strip

      research = ""
      puts "search_for or exit?"
      research = gets.strip
      unless research == "exit"
        search_for
      end
  end

  def run(place)
    make_places(place)
    add_attributes
    display_places
  end

  def make_places(name)
    scraper = Top25::Scraper.new
    arrofplaces = scraper.scrap(name)
    Top25::Place.create_from_collection(arrofplaces)
  end

  def display_places
    Top25::Place.all.each do |pl|
      puts "#{pl.num}. #{pl.name}-based in: #{pl.location}"
    end
     puts "----------------------".colorize(:green)
  end

  def add_attributes
    Top25::Place.all.each do |place|
    h =Top25::Scraper.scrap_show_page(place.url)
    place.add_attr(h)
  end

  end


end
