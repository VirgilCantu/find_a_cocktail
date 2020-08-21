class API
    
    def self.find_cocktails(cocktail)
        url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{cocktail}"
        response = RestClient.get(url)
        cocktail_hash = JSON.parse(response.body,symbolize_names:true)
        matches_arr = cocktail_hash[:drinks]
        
        
        matching_cocktails = matches_arr.map do |drink|
            Cocktail.new(drink)
            
        end
        binding.pry
    end
    

end