require_relative 'player'

describe Player do

	before do
		@inital_health = 150
		@player = Player.new("larry", @inital_health)
		$stdout = StringIO.new

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

	context 'with health greater than 150' do
		before do
			@inital_health = 175
			@player = Player.new("larry", @inital_health)
		end

		it 'player is strong' do
			@player.should be_strong
		end

	end

	context 'with health less than 100' do
		before do 
			@inital_health = 90
			@player = Player.new("larry", @inital_health)
		end

		it 'player is weak' do
			@player.should_not be_strong
		end

	end

	context "in a collection of players" do
		before do
		    @player1 = Player.new("moe", 100)
		    @player2 = Player.new("larry", 200)
		    @player3 = Player.new("curly", 300)

		    @players = [@player1, @player2, @player3]
	  	end

		it "is sorted by decreasing score" do
	    	@players.sort.should == [@player3, @player2, @player1]
	  	end
end

end