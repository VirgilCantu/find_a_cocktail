class CLI

    def welcome 
        puts ""
        puts "---------------------------"
        puts "Welcome to Find a Cocktail!".colorize(:blue)
        puts "---------------------------"
        puts ""  
        start
    end
    
    def start
        puts ""
        puts "Please type the name of a cocktail to start a new search, or type 'exit' to quit".colorize(:green)
        puts ""
        input = gets.strip.downcase
        if input == 'exit'
            exit
        elsif API.find_cocktails(input) == nil
            start
        else    
            Cocktail.all.each.with_index(1) do |c, i|
                puts""
                puts "#{i}. #{c.name}".colorize(:light_blue)
            end
        puts ""
        select_cocktail
        end
    end

    def select_cocktail
        puts "Please select a cocktail by its number for more information or type 'exit' to quit.".colorize(:green)
        puts ""
        input = gets.strip.downcase
        if input == "exit"
            exit
        else
            input = input.to_i
            until input <= Cocktail.all.count && input > 0
                puts "Invalid selection, please try again.".colorize(:red)
                puts ""
                input = gets.strip.to_i
            end
            Cocktail.grab_cocktail(input)
            search_again_show_me
        end
    end

    def search_again_show_me
        
        puts "To see an example of the finished cocktail type 'finished'.".colorize(:blue)
        puts "To learn how to make this cocktail type 'show me'.".colorize(:green)
        puts "To look for another cocktail type 'search'.".colorize(:yellow)
        puts "To quit, type 'exit'."
        puts ""

        input = gets.strip

        if input == "show me"
             Cocktail.show_me
        elsif input == "search"
            Cocktail.reset_current
            start
        elsif input == "exit"
            exit
        elsif input == "finished"   
             Cocktail.finished
        else 
            puts ""
            puts "Sorry, that was not a valid command, please try again.".colorize(:red)
            puts ""
            search_again_show_me
        end
    end

    def exit
        puts ""
        puts "Thank you for using Find a Cocktail! Enjoy responsibly!".colorize(:yellow)
    end

end