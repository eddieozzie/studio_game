require_relative 'player'

describe Player do

	it "has a capitalized name"  do
		player = Player.new("larry", 10)
		player.name.should == "Larry"
	end

	it "has an initial health" do
		player = Player.new("Larry")
		player.health.should == 100
	end

	it "has a string representation" do
		player = Player.new("Larry", 10)
		player.to_s.should == "I'm #{player.name} with a health of #{player.health} and a score of #{player.score}"
	end

	it "computes a score as the sum of its health and length of name" do
		player = Player.new("Larry", 10)
		player.score.should == player.health + player.name.length
	end

	it "increases health by 15 when w00ted" do
		health = 10
		player = Player.new("Larry", health)
		player.w00t
		player.health.should == health + 15
	end

	it "decreases health by 10 when blammed" do
		health = 10
		player = Player.new("Larry", health)
		player.blam
		player.health.should == health - 10
	end

end