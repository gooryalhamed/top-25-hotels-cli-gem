class Top25::Scraper
  def self.scrap(placename)
    scrapped_places =[]
    html = open("https://www.tripadvisor.com/TravelersChoice-#{placename}")
    scrapped_page = Nokogiri::HTML(html)
    array = scrapped_page.css("div#WINNERVIEWER")  #array of places :hotels,rest,beaches ..etc
    array.each do |e|
      place = {}
      e.css("div.winnerLayer").each do |attribute|
        num = attribute.css("div.posn").text
        name = attribute.css("div.winnerName .mainName").txt
        location = attribute.cass("div.winnerName .smaller")
        place[:num] = num
        place[:name] = name
        place[:location]
      end
    scrapped_places << place
    end
    return scrapped_places
  end

end
