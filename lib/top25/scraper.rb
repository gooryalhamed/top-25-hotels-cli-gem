class Top25::Scraper
BASE_URL = "https://www.tripadvisor.com"
  def scrap_index_page(placename)

    scrapped_places =[]
    html = open("#{BASE_URL}/TravelersChoice-#{placename}")
    scrapped_page = Nokogiri::HTML(html)
    array = scrapped_page.css("div#WINNERVIEWER")

    array.each do |pl|
##putting place={} here will make over writing [0 => {num=>"", :name =>"", :location =>""}, 1 =>{}.... ]
      pl.css("div.posRel").each do |e|
        if e.css("div.misc a").length > 0
        place = {}
        num = e.css("div.posn").text.gsub(/\s/,"")
        name = e.css("div.winnerName .mainName").text.gsub(/\s/,"")
        location = e.css("div.winnerName .smaller").text.gsub(/\s/,"")

          url = e.css("div.misc a").attribute("href").value
          place[:url] = "#{BASE_URL}+#{url}"
        place[:num] = num
        place[:name] = name
        place[:location] = location
        scrapped_places << place
    end
      end
    end
    return scrapped_places
  end

end
