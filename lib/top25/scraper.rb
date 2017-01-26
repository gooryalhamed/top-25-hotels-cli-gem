class Top25::Scraper
  
  def scrap(placename)
    scrapped_places =[]
    html = open("https://www.tripadvisor.com/TravelersChoice-#{placename}")
    scrapped_page = Nokogiri::HTML(html)
    array = scrapped_page.css("div#WINNERVIEWER")

    array.each do |e|  #for each place we will make a hash

      e.css("div.winnerLayer").each do |attribute|      #{num=>"", :name =>"", :location =>""}
        place = {}
        num = attribute.css("div.posn").text.gsub(/\s/,"")
        name = attribute.css("div.winnerName .mainName").text.gsub(/\s/,"")
        location = attribute.css("div.winnerName .smaller").text.gsub(/\s/,"")
        place[:num] = num
        place[:name] = name
        place[:location] = location
        scrapped_places << place
      end
    end
    return scrapped_places
  end

end
