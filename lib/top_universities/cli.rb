class TopUniversities::CLI 
  def call 
    TopUniversities::Scraper.new.make_universities
    universities = TopUniversities::University.all 
    universities.shift
    universities.each do |u|
      puts "#{u.url}"
      puts ""
    end
    
  end 
end