class CLI

    def welcome 
        puts "Welcome to Find A Cocktail!"
        puts "---------------------------"
        puts ""  
        start
    end
    
    def start
        puts "Please type the name of a cocktail to start a new search."
        puts ""
        input = gets.strip.downcase
        API.find_cocktails(input)
        puts ""
        Cocktail.all.each.with_index(1) do |c, i|
            puts "#{i}. #{c.name}"
        end
        puts ""
        select_cocktail
    end

    def select_cocktail
        puts "Please select a cocktail by its number for more information."
        puts ""
        input = gets.strip.to_i
        until input <= Cocktail.all.count
            puts "Invalid selection, please try again."
            input = gets.strip.to_i
        end
        Cocktail.grab_cocktail(input)
    end


    
end