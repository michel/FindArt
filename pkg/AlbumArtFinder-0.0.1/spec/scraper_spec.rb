require File.dirname(__FILE__) + '/spec_helper.rb'

# Time to add your specs!
# http://rspec.info/
describe Scraper do
  
  before(:all) do
   #unregister scapers  
   Scraper.unregister_scrapers!   
  end  
  
  it "Should let site specific scaper classes self register" do     
     @scraper = Scraper.new
     @scraper.scrapers.class == Hash 
     
     class TestScraper < Scraper
       register_scraper :test_scraper       
     end   
     @scraper.scrapers.size.should_not be(0)
     
     @scraper.scrapers[:test_scraper].should_not be(nil)
  end  
  
  
  it "Should remove all registerd scrapers when unregister_scrapers! is called" do     
    @scraper = Scraper.new
    
    class TestScraper < Scraper
      register_scraper :test_scraper       
    end
    
    @scraper.scrapers.size.should be(1)
    Scraper.unregister_scrapers! 
    @scraper.scrapers.size.should be(0)   
    
  end
  
  
  it "Should use all registerd scrapers to find album art" do        
     
     @scraper = Scraper.new
       
      # mock test scraper
      class TestScraper < Scraper
        def scrape(artist,title,opts=nil)
          "http://cdn.images.juno.co.uk/full/CS1425717-02A-BIG.jpg"
        end  
        register_scraper :test_scraper                           
      end  
      
      
      # mock test scraper2
      class TestScraper2 < Scraper
        def scrape(artist,title,opts=nil)
          "http://cdn.images.juno.co.uk/full/33333333-02A-BIG.jpg"
        end  
        register_scraper :test_scraper2                           
      end
          
     @scraper.scrapers.size.should be(2)
    
     artist = "FREELAND"
     title = "Do You"
     result = @scraper.find_art(artist,title)
     result.should be_an_instance_of(Array)
     result.should include("http://cdn.images.juno.co.uk/full/CS1425717-02A-BIG.jpg")  
     result.should include("http://cdn.images.juno.co.uk/full/33333333-02A-BIG.jpg")
         
  end 
  
  
  it "Should return an empty array when no album art is found" do        
       @scraper = Scraper.new
       Scraper.unregister_scrapers!                    
       @scraper.scrapers.size.should be(0)
       
       class TestScraper < Scraper
         def scrape(artist,title,opts=nil)
           nil
         end  
         register_scraper :test_scraper                           
       end
      
       result = @scraper.find_art("no_way_that_there_is_an_artist_with_this_name","this_is_a_non_existing_album_tile")
       result.should be_an_instance_of(Array)
       result.size.should be(0)     
  end 
  
  it "Should set the url where the scaper starts" do
    
      class TestScraper < Scraper
        start_url "http://www.junodownload.com/search/"
        register_scraper :test_scraper                           
      end

      class TestScraper2 < Scraper
        start_url "http://www.junodownload2.com/search/"
        register_scraper :test_scraper2                           
      end

      TestScraper.url.should == "http://www.junodownload.com/search/"
      TestScraper2.url.should == "http://www.junodownload2.com/search/" 
      TestScraper.url.should == "http://www.junodownload.com/search/"     
    
  end  
  
  
  
  it "Should return an array of the hostnames of the websites that are being used in registerd scrapers" do
     class TestScraper < Scraper
      start_url "http://www.google.com"
      register_scraper :test_scraper                           
    end       
    
    Scraper.registerd_sites.should include("www.google.com")
  end
  
  
  
  
end
