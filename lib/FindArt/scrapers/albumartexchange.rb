module FindArt
  class AlbumArtExchange < Scraper          
    start_url "http://www.albumartexchange.com/covers.php?sort=7&q="  
    register_scraper :albumartexchange
  
    def scrape(artist,title,opts={})
      url = nil    
      search_url =  "#{@@url}#{CGI.escape("#{artist} #{title}")}"
      browser = WWW::Mechanize.new    
      browser.get(search_url) do |page|
        doc = Hpricot(page.body)    
        element =  doc.at("* table tr td a img[@width='150']")
        src = element["src"] if !element.nil? && !element["src"].nil?
        if src
          path = src.split("src=").last
          url = "http://www.albumartexchange.com#{URI.decode(path)}"      
        end
      end
     url
    end    
  end                           
end
