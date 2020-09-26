#!/usr/bin/env ruby

require_relative "craps_helper"
require_relative "craps"
require_relative "personal_funds"

include CrapsHelper

class BetError < StandardError
end

# initial funds is 1000 euros
personal_funds = PersonalFunds.new(100_000)
loop do
  begin
    puts "You have #{personal_funds.balance_in_euros}"
    print "How much do you want to bet: "
    bet = Integer(gets)
    raise(BetError, "You must enter a positive bet") unless bet.positive?
    raise(BetError, "You can't enter a bet more than #{personal_funds.balance_in_euros}") if bet > personal_funds.balance_in_euros
    
  rescue ArgumentError
    puts "You must input a valid bet"
    retry
  rescue BetError => e
    puts e.message
    retry
  end
  craps = Craps.new
  puts "\nPress ENTER to play craps"
  gets
  craps.play
  craps.rolls.each do |roll|
    puts "You rolled #{roll}!"
  end
  display_win_or_lose(craps.win_state)
  display_score(Craps)

  if craps.win_state
    puts "You have recieved #{bet}"
    # convert bet to cents before adding to personalFunds
    personal_funds.add(bet * 100)
  else
    puts "You have lost #{bet}"
    # convert bet to cents before deducting from personalFunds
    personal_funds.deduct(bet * 100)
  end
  if personal_funds.balance > 0
    print "Do you want to play again? [y, n]: "
    choice = gets.chomp.upcase
    break if choice == "N"
  else
    puts "You have no more money. Game Over."
    break
  end
end
