class Cocktail

    attr_accessor :name, :glass, :ingredients, :measurements, :instructions, :video
    @@all = []
    
    def initialize(name, glass, instructions, video, ingredients)
        @name = name
        @glass = glass
        @instructions = instructions
        @video = video
        @ingredients = ingredients
        @@all << self
    end

    def self.all
        @@all
    end

end