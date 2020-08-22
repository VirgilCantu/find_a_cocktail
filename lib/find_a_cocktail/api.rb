class API
    
    def self.find_cocktails(cocktail)
        url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{cocktail}"
        response = RestClient.get(url)
        if response.body == "{\"drinks\":null}"
            puts ""
            puts "Sorry, that drink is not in the database, please try again.".colorize(:red)
            puts ""
            
        else
            cocktail_hash = JSON.parse(response.body,symbolize_names:true)
            matches_arr = cocktail_hash[:drinks]
            matches_arr.each do |drink|
                name = drink[:strDrink]
                glass = drink[:strGlass]
                instructions = drink[:strInstructions]
                video = drink[:strVideo]
                image = drink[:strDrinkThumb]
                ingredients = []
                measurements = []

                15.times do |i|
                    if drink["strMeasure#{i+1}".to_sym] != nil && drink["strIngredient#{i+1}".to_sym] != nil
                        measurements << drink["strMeasure#{i+1}".to_sym]
                        ingredients << drink["strIngredient#{i+1}".to_sym]
                    end
                end

                recipe = ingredients.zip(measurements)
                
                Cocktail.new(name, glass, instructions, video, recipe, image)

            end
        end
    end
end