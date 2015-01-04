class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    # YOUR CODE HERE
    case player1[1]
    when "P"
    	case player2[1]
    	when "P"
    		# player1 wins
    		return player1
    	when "R"
    		return player1
    	when "S"
    		return player2
    	else
    		raise RockPaperScissors::NoSuchStrategyError,"Strategy must be one of R,P,S"		
    	end
    when "R"
    	case player2[1]
    	when "P"
    		return player2
    	when "R"
    		# player1 wins
    		return player1
    	when "S"
    		return player1
    	else
    		raise RockPaperScissors::NoSuchStrategyError,"Strategy must be one of R,P,S"		
    	end
    when "S"
    	case player2[1]
    	when "P"
    		return player1
    	when "R"
    		return player2
    	when "S"
    		# player1 wins
    		return player1
    	else
    		raise RockPaperScissors::NoSuchStrategyError,"Strategy must be one of R,P,S"		
    	end
    else
    	raise RockPaperScissors::NoSuchStrategyError,"Strategy must be one of R,P,S"
    end
  end

  def self.tournament_winner(tournament)
    # YOUR CODE HERE
    if tournament[0][0].is_a? String#eg:nombre jugador
    	return self.winner(tournament[0],tournament[1])
    end
    return self.winner(self.tournament_winner(tournament[0]), self.tournament_winner(tournament[1]))
  end

end
