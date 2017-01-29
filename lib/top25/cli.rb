class Top25::Cli

  def home
      puts "Search for the best in the world, choose one of the follwing numbers"
      puts "1. Hotels\n2. Restaurants\n3. Beaches\n4. e for exit\n5. b for going back"
  end

  def take_input
    input =""
    input = gets.strip
    search(input)
  end

  def search(s)
    case s
    when "1"
      run("Hotels")
      take_input
    when "2"
      run("Restaurants")
      take_input
    when "3"
      run("Beaches")
      take_input
    when "b"
      take_input
    when s != "1" || s != "2" || s !="3" || s !="b"
        puts "sorry, you only can search hotels,restaurants and beaches"
        take_input
    when "e"
      puts "Good bye!!"
    end
end

  def run(place)
    make_places(place)
    #add_attributes
    display_places
  end

  def make_places(name)
    scraper = Top25::Scraper.new
    arrofplaces = scraper.scrap_index_page(name)
    Top25::Place.create_from_collection(arrofplaces)
  end

  def display_places
    Top25::Place.all.each do |pl|
      puts "#{pl.num}. #{pl.name}-based in: #{pl.location}"
      puts "Website: #{pl.url}"
      puts "-------------------------------------".colorize(:green)
      end
  end

end
=begin
    def add_attributes
      scraper = Top25::Scraper.new
      Top25::Place.all.each do |place|
        h = scraper.scrap_show_page(place.url)
        place.add_attr(h)
        end
    end
=end
