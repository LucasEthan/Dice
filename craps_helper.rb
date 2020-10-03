module CrapsHelper

  class BetError < StandardError
  end

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

  def pause_game
    puts "\nPress ENTER to play craps"
    gets
  end

  def input_bet(personal_funds)
    bet = Integer(gets)
    raise(BetError, "You must enter a positive bet") unless bet.positive?
    raise(BetError, "You can't enter a bet more than #{personal_funds.balance_in_euros}") if bet > personal_funds.balance_in_euros
    bet
  end

  def display_rolls(craps)
    craps.rolls.each do |roll|
    puts "You rolled #{roll}!"
    end
  end

  def update_funds(craps, bet, personal_funds)
      if craps.win_state
         puts "You have recieved #{bet} euros"
         # convert bet to cents before adding to personalFunds
         personal_funds.add(bet * 100)
      else
         puts "You have lost #{bet} euros"
         # convert bet to cents before deducting from personalFunds
         personal_funds.deduct(bet * 100)
      end
  end

  def play_again_prompt
    print "Do you want to play again? [y, n]: "
    choice = gets.chomp.upcase
  end

  def start_game(bet, personal_funds, craps)
    pause_game
    craps.play
    display_rolls(craps)
    display_win_or_lose(craps.win_state)
    display_score(Craps)
    update_funds(craps, bet, personal_funds)
  end

end
