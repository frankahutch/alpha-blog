# create hash
$dial_book = {
  "Yorkton" => "204",
  "Birmingham" => "205", 
  "Seattle" => "206",
  "Portland" => "207",
  "Boise" => "208",
  "Fresno" => "209",
  "San Antonio" => "210",
  "New York" => "212",
  "Los Angeles" => "213",
  "Dallas" => "214"
} 

# create array
$msp_dial_book_arr = []
$dial_book.each { |k, v| $msp_dial_book_arr.push(k[0])}

# define methods
def get_city_names(somehash)
  somehash.each { |k, v| puts "     " + k }
end

def get_area_code(somehash, key)
  somehash[key]
end

def mispCheck(answer2)
  $msp_dial_book_arr.each do |i|
    if answer2.include? "#{i}"
      idx = $msp_dial_book_arr.index(i)
      db_idx = $dial_book.keys[idx.to_int]                        
      puts "Did you mean '#{db_idx}'? Enter 'y' for yes or 'n' for no."             
      answer2 = gets.chomp.downcase            
      if answer2 == "y"
        puts "The area code for #{db_idx} is #{get_area_code($dial_book, db_idx)}."                
        displayCities_002
      elsif answer2 == "n"                
        puts "Ok. Let's try again."                                
        displayCities_003                
      else                
      puts "Your entry '#{answer2}' is invalid."                
        displayCities_003      
      end
    end
  end  
end       
     
def displayCities_000
  puts "Do you want to lookup an area code based on a city name? Enter 'y' for yes or 'n' for no."
  answer = gets.chomp.downcase   
  if answer == "y"
    displayCities_003
  elsif answer == "n"                        
    puts "Goodbye"           
  else        
    puts "Your entry '#{answer}' is invalid. " +
         "Please try again. Try entering 'y' for yes or 'n' for no if you want to exit."                     
    displayCities_001        
  end
end

def displayCities_001
  displayCities_000
end

def displayCities_002
  puts "Do you want to lookup another area code? Enter 'y' for yes or 'n' for no."
  answer3 = gets.chomp.downcase                
  if answer3 == "y"
    displayCities_003
  elsif answer3 == "n"                        
    puts "Goodbye"                            
  else        
    puts "Your entry '#{answer3}' is invalid. " +
         "Please try again. Try entering 'y' for yes or 'n' for no this time."                     
    displayCities_002               
  end
end
            
def displayCities_003    
  $match = false
  puts "Here is a list of cities:"        
  get_city_names($dial_book)     
  def displayCities_004
    puts "Which city do you want the area code for? (type 'exit' to exit)"
    answer2 = gets.chomp              
    $msp_dial_book_arr.each { |i| if answer2.include? "#{i}" then $match = true end } 
    if $dial_book.include?(answer2)                    
      puts "The area code for #{answer2} is #{get_area_code($dial_book, answer2)}."                       
      displayCities_002
    elsif answer2 == 'exit' ||  answer2 == 'EXIT'                            
      puts "Goodbye"              
    elsif ($dial_book.include?(answer2) == false) && ($match == true)
      mispCheck(answer2)
    else            
    puts "Your entry '#{answer2}' is invalid. " +
         "Please make sure you have entered a valid city name as it is shown (case sensitive)."
    displayCities_004                
    end   
  end 
  displayCities_004
end  

#start method
displayCities_000
