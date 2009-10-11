module FindArt
  class WalMart < Scraper          
    start_url "http://www.walmart.com/search/search-ng.do?earch_sort=2&search_query="  
    register_scraper :walmart
  
    def scrape(artist,title,opts={})
      url = nil    
      search_url =  "#{@@url}#{CGI.escape("#{artist} #{title}")}"
      browser = WWW::Mechanize.new    
      browser.get(search_url) do |page|
        doc = Hpricot(page.body)    
      
        # check if there are multiple results and get the top result
        element =  doc.at("* .firstRow a")        
        if !element.nil?
           # extract and fetch item page
           item_page = browser.get(element.attributes["href"])
           doc = Hpricot(item_page.body)
        end                           
      
        #extract art from product page
        url = extract_art(doc)
      end
     url
    end 
  
    # Extracts album art url from wallmart product page
    def extract_art(doc)
       url = nil
       element =  doc.at("* div[@class='LargeItemPhoto150'] a[@href^=javascript]")
        href = element["href"] if !element.nil? && !element["href"].nil?
        if href
          match, url = *href.match(/javascript:photo_opener\('(http:\/\/.*.jpg)&/)
        end
        url    
    end   
  end  
end
