class Cocktail

    attr_accessor :name, :glass, :recipe, :instructions, :video
    @@all = []
    
    def initialize(name, glass, instructions, video, recipe)
        @name = name
        @glass = glass
        @instructions = instructions
        @video = video
        @recipe = recipe
        @@all << self
    end

    def self.all
        @@all
    end

    def self.grab_cocktail(input)
         found_cocktail = self.all.find do |cocktail|
            cocktail == Cocktail.all[input - 1]
        end
        puts ""
        puts "--------------------"
        puts found_cocktail.name    
        puts "--------------------"
        puts ""
        puts "Recipe:"
        puts ""
        puts found_cocktail.recipe
        puts ""
        puts "Glass"
        puts ""
        puts found_cocktail.glass
        puts ""
        puts "Instructions"
        puts ""
        puts found_cocktail.instructions

    end

end