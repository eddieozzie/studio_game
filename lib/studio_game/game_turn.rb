require_relative 'die'
require_relative 'player'
require_relative 'treasure_trove'

module GameTurn 

	def self.take_turn(player)

		die = StudioGame::Die.new

		case die.roll 
		when 1..2
			player.blam
		when 3..4 
			puts "#{player.name} was skipped"
		else 
			player.w00t
		end

		treasure = StudioGame::TreasureTrove.random

		player.found_treasure(treasure)


		puts "#{player.name} found a #{treasure.name} worth #{treasure.points} points"

	end

end