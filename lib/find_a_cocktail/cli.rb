class CLI

    def start
        puts "Welcome to Find A Cocktail!"
        puts "Please type the name of a cocktail to initiate search"
        input = gets.strip.downcase
        API.find_cocktails(input)
        Cocktail.all.each.with_index(1) do |c, i|
            puts "#{i}. #{c.name}"
        end
        select_cocktail
    end

    def select_cocktail
        puts "Please select a cocktail by its number for more information"
        input = gets.strip.to_i
    end
    
end