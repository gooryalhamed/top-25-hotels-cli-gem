class Top25::CLI
  def call
    search_for
  end
  
  def search_for
    search =""
    pust "What would you like to search for?"
    search = gets.strip
    case search.downcase
      when "hotels"
        make_places(Hotel,"Hotels")
        display_places(Hotel)
      when "restuarants"
        make_places(Restaurant,"Restaurants")
        display_places(Restaurant)
      when "beaches"
        make_places(Beach,"Beaches")
        display_places(Beach)
      else
        puts "sorry, you only can search hotels,restaurants and beaches"
      end
  end

  def make_places(placemodel,name)
    arrofplaces = Scraper.scrap(name)
    placemodel.create_from_collection(arrofplaces)
  end

  def display_places(placemodel)
    placemodel.all.each do |pl|
      puts "#{pl.num}. #{pl.name}-based in: #{pl.location}"
    end
     puts "----------------------".colorize(:green)
  end

end
