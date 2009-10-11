require File.dirname(__FILE__) + '/spec_helper.rb'

describe JunoDownload do

  it "Should have a start url form where the scaper starts" do
    JunoDownload.class_variables.should include("@@url")  
    JunoDownload.url.should ==  'http://www.junodownload.com/search/'           
  end
  
  it "Should find the album art url for DJ TIESTO - In Search Of Sunrise 6" do
     @juno =  JunoDownload.new()
     @juno.scrape("TIESTO","In Search of Sunrise 6").should == "http://cdn.images.juno.co.uk/full/CS1270430-02A-BIG.jpg"
  end                                                               
  
  it "Should return nil when no album art is found" do
#    @juno =  JunoDownload.new()
 #   @juno.scrape("Irene Moors & De Smurfen","Ga Je Mee Naar Smurfenland").should be(nil)
  end
  
  it "Should find the album art for the following albums" do
    @juno =  JunoDownload.new()    
    @juno.scrape("Social Disco Club & Maia","The Way You Move").should == "http://cdn.images.juno.co.uk/full/CS1432822-02A-BIG.jpg"
    @juno.scrape("2SONIC","Bump Da Funk").should == "http://cdn.images.juno.co.uk/full/CS1427835-02A-BIG.jpg"
    @juno.scrape("AIRPORT","Song 2 1").should == "http://cdn.images.juno.co.uk/full/CS1408816-02A-BIG.jpg"
    @juno.scrape("1 LOVE","Beat It").should == "http://cdn.images.juno.co.uk/full/CS1442946-02A-BIG.jpg" 
    @juno.scrape("","trance world 7").should == "http://cdn.images.juno.co.uk/full/CS1436448-02A-BIG.jpg"
  end
  
  
  
    
end
