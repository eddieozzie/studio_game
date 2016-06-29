class Player
	def initialize(name, health=100)
		@name = name.capitalize
		@health = health 
	end

	def say_hello()
		"I'm #{@name} with a health of #{@health}"
	end

end

player1 = Player.new("bob")
puts player1.inspect
puts player1.say_hello