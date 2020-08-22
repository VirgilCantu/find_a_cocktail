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
        puts "Recipe:".colorize(:cyan)
        puts ""
        @@current_cocktail.recipe.each do |pair|
            puts "#{pair[0]}" + " - " + "#{pair[1]}".colorize(:blue)
        end
        puts ""
        puts "Glassware:".colorize(:cyan)
        puts @@current_cocktail.glass
        puts ""
        puts "Instructions:".colorize(:cyan)
        puts @@current_cocktail.instructions
        puts ""

    end

    def self.show_me
        if @@current_cocktail.video == nil
            puts ""
            puts "Sorry, this cocktail doesn't have a video available".colorize(:red)
            self.reset
            CLI.new.start
        else 
            puts ""
            puts @@current_cocktail.video.colorize(:cyan)
            self.reset
            CLI.new.start
        end
    end

    def self.finished
        if @@current_cocktail.image == nil
            puts ""
            puts "Sorry, this cocktail doesn't have an image available".colorize(:red)
            self.reset
            CLI.new.start
        else 
            puts ""
            puts @@current_cocktail.image.colorize(:cyan)
            self.reset
            CLI.new.start
        end    
    end

    def self.reset
        @@all.clear
    end

end