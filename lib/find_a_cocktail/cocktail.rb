class Cocktail

    attr_accessor :name, :glass, :recipe, :instructions, :video, :image
    
    @@all = []
    
    def initialize(name, glass, instructions, video, recipe, image)
        @name = name
        @glass = glass
        @instructions = instructions
        @video = video
        @recipe = recipe
        @image = image
        @@all << self
    end

    def self.all
        @@all
    end

    def self.grab_cocktail(input)
         @@current_cocktail = self.all.find do |cocktail|
            cocktail == Cocktail.all[input - 1]
        end

        puts ""
        puts "--------------------"
        puts @@current_cocktail.name.colorize(:red)
        puts "--------------------"
        puts ""
        puts "Recipe:"
        puts ""
        puts @@current_cocktail.recipe
        puts ""
        puts "Glassware:"
        puts @@current_cocktail.glass
        puts ""
        puts "Instructions:"
        puts @@current_cocktail.instructions
        puts ""

    end

    def self.show_me
        if @@current_cocktail.video == nil
            puts ""
            puts "Sorry, that cocktail doesn't have a video available".colorize(:red)
            self.reset_current
            CLI.new.start
        else 
            puts ""
            puts @@current_cocktail.video
            self.reset_current
            CLI.new.start
        end
    end

    def self.finished
        if @@current_cocktail.image == nil
            puts ""
            puts "Sorry, that cocktail doesn't have an image available".colorize(:red)
            self.reset_current
            CLI.new.start
        else 
            puts ""
            puts @@current_cocktail.image
            self.reset_current
            CLI.new.start
        end    
    end

    def self.reset_current
        @@all.clear
    end

end