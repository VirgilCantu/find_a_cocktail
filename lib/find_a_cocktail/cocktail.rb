class Cocktail

    attr_accessor :name, :glass, :ingredients, :measurements, :instructions
    @@all = []
    
    def initialize(drink)
        self.name = drink[:strDrink]
        self.glass = drink[:strGlass]
        self.instructions = drink[:strInstructions]
        @@all << self
    end

    def self.all
        @@all
    end

end