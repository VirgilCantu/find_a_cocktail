class CLI

    def start
        puts "Welcome to Find A Cocktail!"
        puts "Please type the name of a cocktail"
        input = gets.strip.downcase
        API.find_cocktails(input)
    end
    
end