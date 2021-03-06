require_relative 'treasure_trove'
require_relative 'playable'

module StudioGame
	class Player

		include Playable

		attr_accessor :name, :health
		attr_reader :found_treasures

		def initialize(name, health=100)
			@name = name.capitalize
			@health = health 
			@found_treasures = Hash.new(0)
		end

		def found_treasure(treasure)
			@found_treasures[treasure.name] += treasure.points
			puts "#{@name} found a #{treasure.name} worth #{treasure.points} points"
			puts "#{@name}'s treasures: #{@found_treasures}"
		end

		def each_found_treasure
			@found_treasures.each do |treasure, points|
				yield StudioGame::Treasure.new(treasure, points)

			end
		end

		def self.from_csv(line)	
			name, health = line.split(",")
			StudioGame::Player.new(name, Integer(health))
		end

		def points
			@found_treasures.values.reduce(0, :+)
		end

		def name=(new_name)
			@name = new_name.capitalize
		end

		def to_s()
			"I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
		end

		def score()
			@health + points
		end

		def <=>(other_player)
			other_player.score <=> score
		end
	end
end

if __FILE__ == $0
	player = StudioGame::Player.new("moe")
	puts player.name
	puts player.health
	player.w00t
	puts player.health
	player.blam
	puts player.health
end



