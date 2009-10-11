module FindArt
  class JunoDownload < Scraper          
    start_url "http://www.junodownload.com/search/"  
    register_scraper :junodownload
  
    def scrape(artist,title,opts={})
      url = nil 
    
      browser = WWW::Mechanize.new
      browser.get(@@url) do |page|    
        # go to search form
        search = page.form_with(:action => 'http://www.junodownload.com/search/') do |f|
           f.q  = "#{artist} #{title}"        
         end.click_button       
         doc = Hpricot(search.body) 
         element = doc.at('.productcover img[@src^="http://cdn.images.juno.co.uk/75/"]')
         src = nil  
         if !element.nil?           
           src = element.attributes['src'] 
           # instead of cliking on the image to find the uri of the larger image we will replace some parts of the url
           # lets hope junodownload keeps this convention 
           src.gsub!("/75/","/full/")
           src.gsub!("-TN","-BIG")   
           url = src  
         end
      end
      url   
    end
    
  end           
end
