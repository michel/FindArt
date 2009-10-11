# require File.dirname(__FILE__) + '/spec_helper.rb'
# 
# describe Amazon do 
# 
#   it "Should have a start url form where the scaper starts" do
#     Amazon.class_variables.should include("@@url")  
#     Amazon.url.should ==  'http://webservices.amazon.com/'           
#   end
#   
#   it "Should find the album art url for DJ TIESTO - In Search Of Sunrise 6" do
#      @amazon =  Amazon.new()
#      @amazon.scrape("DJ TIESTO","In Search of Sunrise 6").should == "http://ecx.images-amazon.com/images/I/515ZxHVU5RL.jpg"
#   end   
#   
#   it "Should find the album art url for Caféine de Christophe Willem  " do
#      @amazon =  Amazon.new()
#      @amazon.scrape("Christophe Willem","Caféine").should == "http://ecx.images-amazon.com/images/I/61sOk67nVkL.jpg"
#   end      
#   
#   it "Should find the album art url for Miss Météores de Olivia Ruiz" do
#      @amazon =  Amazon.new()
#      @amazon.scrape("Olivia Ruiz","Miss Météores").should == "http://ecx.images-amazon.com/images/I/51S7recnyQL.jpg"
#   end 
#   
#   it "Should find the album art url for  初音ミク ベスト impacts" do
#      @amazon =  Amazon.new()
#      @amazon.scrape(" 初音ミク ベスト","impacts").should == "http://ecx.images-amazon.com/images/I/51P-6djocGL.jpg"
#   end  
#   
#   it "Should return nil if no album art is found " do
#     @amazon =  Amazon.new()
#     @amazon.scrape("internets","i did it for teh lulz").should == nil
#   end  
# end
