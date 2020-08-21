class API
    
    def self.find_cocktails(cocktail)
        url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{cocktail}"
        response = RestClient.get(url)
        cocktail_hash = JSON.parse(response.body,symbolize_names:true)
        match_arr = cocktail_hash[:drinks]
        binding.pry
    end

end