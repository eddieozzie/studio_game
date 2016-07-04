require_relative 'game'

player1 = Player.new("bob")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.load_players(ARGV.shift || "players.csv")

loop do 
	puts "\nHow many rounds would you like to play?"
	answer = gets.chomp.downcase

	case answer
	when /^\d+$/
		knuckleheads.play(answer.to_i)
	when "exit", "quit"
		knuckleheads.print_stats
		knuckleheads.save_scores
		break
	else
		puts "Please enter a number or quit"
	end

end


