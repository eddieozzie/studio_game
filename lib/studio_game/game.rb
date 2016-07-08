require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

module StudioGame

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

		def total_points
			@players.reduce(0) {|sum, player| sum + player.points}

		end

		def load_players(file)
			File.readlines(file).each do |line|
				 add_player(Player.from_csv(line))
			end
		end

		def save_scores(file="high_scores.txt")
			File.open(file, 'w') do |file|
				@players.each do |player|
					file.puts create_high_score_entry(player)
				end
			end
		end

		def create_high_score_entry(player)
			formatted_score = player.name.ljust(30, ".")
			"#{formatted_score}#{player.score}"
		end

		def play(rounds)

			treasures = TreasureTrove::TREASURES
			puts "There are #{treasures.count} treasures to be found."
			treasures.each do |treasure| 
				puts "A #{treasure.name} is worth #{treasure.points} points."
			end

			puts "\nThere are #{@players.size} players in #{@title}: "

			@players.each do |player|
					puts player
			end

			1.upto(rounds) do |turn|

				puts "\nRound: #{turn}"

				@players.each do |player|
					GameTurn.take_turn(player)
					puts player
				end
			end
		end

		def print_name_and_health(player)
			puts player.name.ljust(30, ".").concat(player.score.to_s)
		end

		def print_stats 
			strong_players, wimpy_players = @players.partition {|player| player.strong?}

			puts "\name#{total_points} total points from treasure found"

			@players.sort.each do |player|
				puts "\n#{player.name}'s point totals:"
				player.each_found_treasure {|treasure| puts "#{treasure.points} total #{treasure.name} points"}
	  			puts "#{player.points} grand total points"
	  		end

			puts "\n#{strong_players.count} strong players:"
			strong_players.each do |player|
				puts "#{player.name} (#{player.health})"
			end

			puts "#{wimpy_players.count} wimpy players:"
			wimpy_players.each do |player| 
				puts "#{player.name} (#{player.health})"
			end

			@players.sort.each do |player|
				print_name_and_health(player)
			end

		end


	end
end