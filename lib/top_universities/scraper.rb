class TopUniversities::Scraper 
  
  def get_page
    Nokogiri::HTML(open("https://www.topuniversities.com/student-info/choosing-university/worlds-top-100-universities"))
  end
  
  def scrape_universities
    self.get_page.css("div.field-item table tbody tr")
  end
  
  def make_universities
    scrape_universities.each do |u|
      hash = {
        :rank => u.css("div.para")[0].text,
        :name => u.css("div.para")[1].text,
        :url => u.css("div.para")[1].css("a").attribute("href"),
        :location => u.css("div.para")[2].text 
      }
      TopUniversities::University.new(hash)
    end
  end
end

