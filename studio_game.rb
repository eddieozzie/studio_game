class Player

	attr_accessor :name
	attr_reader :health

	def initialize(name, health=100)
		@name = name.capitalize
		@health = health 
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

player1 = Player.new("bob")
puts player1.inspect
puts player1
puts player1.health

player2 = Player.new("larry", 60)
puts player2
puts player2.health 
player2.name = "lawrence"
puts player2.name

player3 = Player.new("curly", 125)
player3.blam
player3.w00t
puts player3.health