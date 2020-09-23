module CrapsHelper
  def display_win_or_lose(win_state)
    if win_state
      puts "You win"
    else
      puts "You lose"
    end
  end

  def display_score(craps)
    puts "\n***** Number of games: #{craps.number_of_games} *****"
    puts "***** Number of wins: #{craps.wins} *****"
    puts "***** Number of losses: #{craps.losses} *****"
  end
end
