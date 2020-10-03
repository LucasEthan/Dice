#!/usr/bin/env ruby

require_relative "craps_helper"
require_relative "craps"
require_relative "personal_funds"

include CrapsHelper

# initial funds is 1000 euros
personal_funds = PersonalFunds.new(100_000)
loop do
  begin
    puts "You have #{personal_funds.balance_in_euros} euros"
    print "How much do you want to bet: "
    bet = input_bet(personal_funds)

  rescue ArgumentError
    puts "You must input a valid bet"
    retry
  rescue BetError => e
    puts e.message
    retry
  end

  craps = Craps.new
  start_game(bet, personal_funds, craps)


  if !personal_funds.zero_balance?
    break if play_again_prompt == "N"
  else
    puts "You have no more money. Game Over."
    break
  end
end
