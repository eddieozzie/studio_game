require_relative 'player'
require_relative 'die'

class Game

	attr_reader :title

	def initialize(title)
		@title = title
		@players = []
	end

	def add_player(player)
		#@players.push(player)
		@players << player
	end

	def play()
		@players.each do |player|
			player.w00t
		end
	end


end
