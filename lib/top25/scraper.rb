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
def scrap_show_page(url)
  html = open("#{url}")
  scrapped_page = Nokogiri::HTML(html)
  arr1 = scrapped_page.css(".bl_details")
  arr2 = scrapped_page.css("div.property_tags")
  show_h = {}  # {:phone => "", :website =>"", :address => {}, :description =>""}

    show_h[:phone] = arr1.css("div.f1 .f1").text
    show_h[:website_url] = arr1.css("div.f1").attribute("href").value

    address = arr1.css("div.format_address")

      show_h[:address][:street] = address.css("div.street_address").text
      show_h[:address][:locality] = address.css("div.locality").text
      show_h[:address][:country]= address.css("div.country_name").text
      show_h
  end

end
