class API
    
    def self.find_cocktails(cocktail)
        url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{cocktail}"
        response = RestClient.get(url)
        cocktail_hash = JSON.parse(response.body,symbolize_names:true)
        matches_arr = cocktail_hash[:drinks]
        matches_arr.each do |drink|
            name = drink[:strDrink]
            glass = drink[:strGlass]
            instructions = drink[:strInstructions]
            video = drink[:strVideo]

            ingredients = []
            
            15.times do |i|
                if drink["strIngredient#{i+1}".to_sym] != nil
                    ingredients << drink["strIngredient#{i+1}".to_sym]
                end
            end

            measurements = []

            15.times do |i|
                if drink["strMeasure#{i+1}".to_sym] != nil
                    measurements << drink["strMeasure#{i+1}".to_sym]
                end
            end

            recipe = ingredients.zip(measurements)

            Cocktail.new(name, glass, instructions, video, recipe)
        end

    end

end