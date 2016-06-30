class Player

	attr_accessor :name
	attr_reader :health

	def initialize(name, health=100)
		@name = name.capitalize
		@health = health 
	end

	def name=(new_name)
		@name = new_name.capitalize
	end

	def blam()
		@health -=10
		puts "#{@name} just got blammed!"
	end

	def w00t()
		@health +=15
		puts "#{@name} just got w00ted!"
	end

	def to_s()
		"I'm #{@name} with a health of #{@health} and a score of #{score}"
	end

	def score()
		health + @name.length
	end


end

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
		puts "There are #{@players.count} players in #{@title}"
		@players.each do |player|
			puts player
		end
		@players.each do |player|
			player.w00t
			player.w00t
			player.blam
		end
	end


end


player1 = Player.new("bob")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play











