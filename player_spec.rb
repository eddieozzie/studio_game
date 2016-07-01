require_relative 'player'

describe Player do

	before do
		@inital_health = 150
		@player = Player.new("larry", @inital_health)
	end

	it "has a capitalized name"  do
		@player.name.should == "Larry"
	end

	it "has an initial health" do
		@player.health.should == 150
	end

	it "has a string representation" do
		@player.to_s.should == "I'm #{@player.name} with a health of #{@player.health} and a score of #{@player.score}"
	end

	it "computes a score as the sum of its health and length of name" do
		@player.score.should == @player.health + @player.name.length
	end

	it "increases health by 15 when w00ted" do
		@player.w00t
		@player.health.should == @inital_health + 15
	end

	it "decreases health by 10 when blammed" do
		@player.blam
		@player.health.should == @inital_health - 10
	end

end