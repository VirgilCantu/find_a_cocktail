class CLI

    def welcome 
        puts ""
        puts "---------------------------"
        puts "Welcome to Find a Cocktail!"
        puts "---------------------------"
        puts ""  
        start
    end
    
    def start
        puts ""
        puts "Please type the name of a cocktail to start a new search, or type 'exit' to quit"
        puts ""
        input = gets.strip.downcase
        if input == 'exit'
        else
        API.find_cocktails(input)
        puts ""
        Cocktail.all.each.with_index(1) do |c, i|
            puts "#{i}. #{c.name}"
        end
        puts ""
        select_cocktail
        end
    end

    def select_cocktail
        puts "Please select a cocktail by its number for more information."
        puts ""
        input = gets.strip.to_i
        until input <= Cocktail.all.count 
            puts "Invalid selection, please try again."
            puts ""
            input = gets.strip.to_i
        end
        Cocktail.grab_cocktail(input)
        search_again_show_me
    end

    def search_again_show_me
        
        puts "To learn how to make this cocktail type 'show me'."
        puts "To look for another cocktail type 'search'."
        puts "To quit, type 'exit'."
        puts ""

        input = gets.strip

        if input == "show me"
            puts Cocktail.show_me
            puts ""
        elsif input == "search"
            Cocktail.reset_current
            start
        elsif input == "exit"

        else 
            puts "Sorry, that was not a valid command, please try again."    
            puts ""
            search_again_show_me
        end
    end

end