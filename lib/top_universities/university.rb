class TopUniversities::University
  attr_accessor:name, :rank, :location, :url
  @@all = []
  
  def initialize(u)
    u.each {|key,value| self.send(("#{key}="),value)}
    @@all << self
  end
  
  def self.all 
    @@all 
  end
end