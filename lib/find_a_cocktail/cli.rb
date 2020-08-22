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
        puts "Please type the name of a cocktail to start a new search, or type #{"exit".red} to quit."
        puts ""
        input = gets.strip.downcase
        if input == 'exit'
            exit
        elsif API.find_cocktails(input) == nil
            start
        else    
            Cocktail.all.each.with_index(1) do |c, i|
                puts""
                puts "#{i}. #{c.name}".colorize(:cyan)
            end
        puts ""
        select_cocktail
        end
    end

    def select_cocktail
        puts "Please select a cocktail by its number for more information or type #{"exit".red} to quit."
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
            options_menu
        end
    end

    def options_menu
        
        puts "To see an example of the finished cocktail type #{"finished".blue}"
        puts "To learn how to make this cocktail type #{"show me".green}"
        puts "To look for another cocktail type #{"search".yellow}"
        puts "To quit, type #{"exit".red}"
        puts ""

        input = gets.strip
        
        case input
            when "show me"
                Cocktail.show_me
            when "search"
                Cocktail.reset_current
                start
            when "exit"
                exit
            when "finished"   
                Cocktail.finished
            else 
                puts ""
                puts "Sorry, that was not a valid command, please try again.".colorize(:red)
                puts ""
                options_menu
        end
    end

    def exit
        puts ""
        puts "Thank you for using Find a Cocktail! Enjoy responsibly!".colorize(:light_magenta)
    end

end