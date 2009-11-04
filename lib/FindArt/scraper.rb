
# Factory that contains site specific scapers.
# Scrapers are classes that collect urls of album art for a given artist and title.
# Scraper classes can self register them self by calling register_scraper in the class body.
# == Example       
#  
#  @scraper = Scraper.new
#
#  class TestScraper < Scraper
#     register_scraper :test_scraper       
#  end
# 
#  @scraper.scrapers 
#  {:test_scraper=>TestScraper}
module FindArt  
  class Scraper
    @@scrapers = {} 
   
  
    # class method for registering scrapers
    def self.register_scraper(name)
      @@scrapers[name] = self
    end
  
    # hash of all registerd scrapers
    def scrapers
       @@scrapers
    end  
  
    def self.registerd_sites
      @@scrapers.map {|scraper_name,klass| URI(klass.url).host}
    end
                           
    # clears all registerd scapers
    def self.unregister_scrapers!
      @@scrapers = {}
    end
  
    # all registerd scrapers are used to find album art 
    # returns an array of urls
    def find_art(artist,title,opts=nil)
      threads = []       
      @@scrapers.each do |scraper_name,klass|  
        scraper = klass.new    
        threads << Thread.new { Thread.current["results"] = scraper.scrape(artist,title,opts)}                  
      end  
      results = []                
      begin
        threads.each {|t| t.join;  results << t["results"] unless t['results'].nil? }           
      rescue
        # todo: make some way to disable  specific scrapers via commandline options
      end
      results
    end

    private
  
    # helper method for setting the url where the scraper starts its search for album art
    #  
    #  == Example 
    #             
    #  class JunoDownload < Scraper          
    #     start_url "http://www.junodownload.com/search/"  
    #     register_scraper :junodownload  
    #  end
    #  
    def self.start_url(url) 
      class_variable_set "@@url", url     
      meta_def :url do
       class_variable_get "@@url"
      end    
    end 
  end         
end


                 
