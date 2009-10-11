# module FindArt
# #                                          
# # class Discogs < Scraper          
# #   start_url "http://www.discogs.com/search?type=all&q="  
# #   register_scraper :discogs
# #   
# #   def scrape(artist,title,opts={})
# #     url = nil    
# #     search_url =  "#{@@url}#{CGI.escape("#{artist} #{title}")}"
# #     browser = WWW::Mechanize.new    
# #     browser.get(search_url) do |page|
# #       doc = Hpricot(page.body)    
# #       
# #       # check if there are multiple results and get the top result
# #       element =  doc.at("* .search_result a")        
# #       if !element.nil?
# #          # extract and fetch item page
# #          item_page = browser.get(element.attributes["href"])
# #          doc = Hpricot(item_page.body)        
# # 
# # 
# #          
# #       end           
# # 
# #       #extract art from product page
# #     end
# #    url
# #   end 
# #   
# #   # Extracts album art url from wallmart product page
# #   def extract_art(doc)
# #     puts doc
# #      # url = nil
# #      #     element =  doc.at("* td[@align='center'] a[href~='/viewimages']")
# #      #      href = element["href"] if !element.nil? && !element["href"].nil?
# #      #      if href
# #      #        match, url = *href.match(/javascript:photo_opener\('(http:\/\/.*.jpg)&/)
# #      #      end
# #      #      url        
# #   end
# #     
# # end
#                
# end