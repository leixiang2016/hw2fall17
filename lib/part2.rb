class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end
def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
	
	strategies = ["R", "P", "S"]
	
	start = [game[0][1].upcase, game[1][1].upcase]
	
	winner = start[0] #assume the first player is winner
	
	if !(strategies.include?(start[0])) or !(strategies.include?(start[1]))
		raise NoSuchStrategyError
	else
		if start.include?("R") && start.include?("S")
			winner = start.index("R")
		elsif start.include?("P") && start.include?("R")
			winner = start.index("P")
		elsif start.include?("S") && start.include?("P")
			winner = start.index("S")
		elsif start[0]==start[1]
			winner = start[0]
		else
			winner = 0
		end	
		return [game[winner][0], game[winner][1]]
	end
end

def rps_tournament_winner(tournament)
	if !(tournament[0][0].is_a?(String))
		player1 = rps_tournament_winner(tournament[0])
		player2 = rps_tournament_winner(tournament[1])
		game = [player1, player2]
		winner = rps_game_winner(game)
	else
		winner = rps_game_winner(tournament)
	end
	return winner
end

#feel free to add your own helper functions as needed




