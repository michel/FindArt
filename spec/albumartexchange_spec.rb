require File.dirname(__FILE__) + '/spec_helper.rb'

describe AlbumArtExchange do  
  
  it "Should have a start url form where the scaper starts" do
    AlbumArtExchange.class_variables.should include("@@url")  
    AlbumArtExchange.url.should ==  'http://www.albumartexchange.com/covers.php?sort=7&q='           
  end
  
  it "Should find the album art url for DJ TIESTO - In Search Of Sunrise 6" do
     @album =  AlbumArtExchange.new()
     @album.scrape("DJ TIESTO","In Search of Sunrise 6").should == "http://www.albumartexchange.com/gallery/images/public/ti/tiesto-insear_02.jpg"
  end                                                               
  
  it "Should return nil when no album art is found" do
    @album =  AlbumArtExchange.new()
    @album.scrape("Irene Moors & De Smurfen","Ga Je Mee Naar Smurfenland").should be(nil)
  end
  
  it "Should find the album art for the following albums" do
    @album =  AlbumArtExchange.new()    
    @album.scrape("Hi_Tack","Let's Dance").should == "http://www.albumartexchange.com/gallery/images/public/hi/hi_tac-letsda.jpg"
    @album.scrape("24 Grana","underpop").should == "http://www.albumartexchange.com/gallery/images/public/24/24gran-underp_02.jpg"
    @album.scrape("Green Day","Dookie").should == "http://www.albumartexchange.com/gallery/images/public/gr/greend-dookie_05.jpg"
  end   
end
