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
            drink.each do |key|
                binding.pry
            end
            Cocktail.new(name, glass, instructions, video, ingredients) 
        end  
    end
end