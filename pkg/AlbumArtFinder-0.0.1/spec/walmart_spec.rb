require File.dirname(__FILE__) + '/spec_helper.rb'

describe WalMart do        
                  
  it "Should have a start url form where the scaper starts" do
    WalMart.class_variables.should include("@@url")  
    WalMart.url.should ==  'http://www.walmart.com/search/search-ng.do?earch_sort=2&search_query='           
  end
  
  it "Should find the album art url for DJ TIESTO - In Search Of Sunrise 6" do
     @wallmart =  WalMart.new()
     @wallmart.scrape("DJ TIESTO","In Search of Sunrise 6").should == "http://i.walmartimages.com/i/p/00/06/70/03/07/0006700307592_500X500.jpg"
  end
  
  it "Should take the first result when multible results are found" do
     @wallmart =  WalMart.new()
     @wallmart.scrape("Daft Punk","").should == "http://i.walmartimages.com/i/p/00/72/43/59/63/0072435963890_500X500.jpg"
  end 
       
  it "Should return nil when no album art is found" do
    @wallmart =  WalMart.new()
    @wallmart.scrape("Irene Moors & De Smurfen","Ga Je Mee Naar Smurfenland").should be(nil)
  end
  

end
