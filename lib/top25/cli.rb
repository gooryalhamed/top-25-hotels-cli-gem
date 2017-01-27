
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
  end

  def run(place)
    make_places(place)
    add_attributes
    display_places

    choose =""
    puts "You can get more details about each one by pressing its number. If you want to go back type back"
    choose = gets.strip
    if choose.between?(1, 25)  then
        display_one(place)
        continue =""
        continue = gets.strip
        unless continue == "back"
          display_one(place)
        end
    else
      puts "you should enter a number between 1 and 25"
    end
    ## research for top25 h,r,b ##
    research = ""
    puts "search_for or exit?"
    research = gets.strip
    unless research == "exit"
      search_for
    end
end


  def make_places(name)
    scraper = Top25::Scraper.new
    arrofplaces = scraper.scrap(name)
    new_place.create_from_collection(arrofplaces)
  end

  def display_places
    Top25::Place.all.each do |pl|
      puts "#{pl.num}. #{pl.name}-based in: #{pl.location}"
      end
      puts "-------------------------------------".colorize(:green)
    end

    def add_attributes
        Top25::Place.all.each do |place|
        h = Top25::Scraper.scrap_show_page(place.url)
        place.add_attr(h)
        end
    end

    def display_one(pl)
      puts "#{pl.name}"
      puts "**********************".colorize(:green)
      puts "Address: #{pl.address}"
      puts "Features: #{pl.info}"
      puts "Phone number: #{pl.phone}"
      puts "Website:#{pl.website}"
      puts "-------------------------------------".colorize(:green)
    end

end
