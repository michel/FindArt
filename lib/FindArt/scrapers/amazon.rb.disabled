module FindArt
  class Amazon < Scraper          
    start_url "http://webservices.amazon.com/"  
    register_scraper :amazon
    @@urls = [                               
     "http://webservices.amazon.com/",    
     "http://webservices.amazon.co.uk/",
     "http://webservices.amazon.co.jp/",
     "http://webservices.amazon.ca/",
     "http://webservices.amazon.fr/",
     "http://webservices.amazon.de/",
    ]
  
  
    # Uses the artist webservice to search for album covers.
    # Tries all international amazon sites
    def scrape(artist,title,opts={})
      search_url = "onca/xml?Service=AWSECommerceService&AWSAccessKeyId=0NK019CD48HNEDK3PBG2&Operation=ItemSearch&SearchIndex=Music&ResponseGroup=Small,Images&Keywords=#{CGI.escape("#{artist} #{title}")}"    
      @@urls.each do |url|
        art = find_best_art("#{url}#{search_url}") 
        return art unless art.nil?
      end
      nil
    end  
  
    private
  
    # Finds the best quality artwork availible at amazon
    def find_best_art(search_url)
     	browser = WWW::Mechanize.new
      search = browser.get(search_url)
      doc = Hpricot(search.body)
    
      large,medium,small = [],[],[]        
      (doc/:item).each do |item|      
         large    << item.at("largeimage").at("url").innerHTML  if item.at("largeimage")
         medium   << item.at("mediumimage").at("url").innerHTML if item.at("mediumimage")    
         small    << item.at("smallimage").at("url").innerHTML  if item.at("smallimage")       
      end
    
      url = small.first  unless small.empty?   
      url = medium.first unless medium.empty?  
      url = large.first  unless large.empty?
    end
    
  end 
end