class TopUniversities::CLI 
  def call 
    TopUniversities::Scraper.new.make_universities
    universities = TopUniversities::University.all 
    universities.shift
    puts "Welcome to the top 100 universities in the world."
    start
  end 
  
  
  def start 
    puts""
    puts"From rank 1-100, which university wou like you to see?"
    input1 = gets.strip.to_i 
    print_university(TopUniversities::University.find(input1))
    puts""
    puts"Would you like like to link to access more information about this school? Y/N"
    input = gets.strip.downcase
    if(input == "y")
      puts ""
      print_link(TopUniversities::University.find(input1))
      puts""
      puts"Would you like to see another university? Y/N"
      input = gets.strip.downcase 
      if(input == "y")
        start
      elsif(input == "n")
        puts ""
        puts "Thank you! Have a nice day!"
        exit
      else
        puts""
        puts"Sorry, I don't understant that answer"
        start
      end
    elsif (input == "n")
      puts""
      puts"Would you like to see another university? Y/N"
      input = gets.strip.downcase 
      if(input == "y")
        start
      elsif(input == "n")
        puts ""
        puts "Thank you! Have a nice day!"
        exit
      else
        puts""
        puts"Sorry, I don't understant that answer"
        start
      end
    else 
      puts""
      puts"Sorry, I don't understant that answer"
      start
    end
  end
  
  
  def print_university(u)
    puts ""
    puts "#{u.name}"
    puts ""
    puts "Ranking:            #{u.rank}"
    puts "Location:           #{u.location}"
  end
  
  def print_link(u)
    puts ""
    puts "---------------------------------"
    puts ""
    puts "More Information on:  #{u.url}"
  end
end