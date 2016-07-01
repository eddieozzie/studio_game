require_relative 'game'

describe Game do

  before do
    @game = Game.new("Knuckleheads")

    @initial_health = 100
    @player = Player.new("moe", @initial_health)
    
    @game.add_player(@player)
  end

  it 'player w00ts when high number is rolled' do
  	Die.any_instance.stub(:roll).and_return(5)
  	@game.play
  	@player.health = initial_health + 15
  end
  
end