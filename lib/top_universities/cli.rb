class TopUniversities::CLI 
  def call 
    TopUniversities::Scraper.new.make_universities
    universities = TopUniversities::University.all 
    
  end 
end