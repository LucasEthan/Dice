#!/usr/bin/env ruby

require_relative "craps_helper"
require_relative "craps"
require_relative "personal_funds"

include CrapsHelper

# initial funds is 1000 euros
personalFunds = PersonalFunds.new(10_0000)

loop do
  puts "You have #{personalFunds.balance_in_euros}"
  print "How much do you want to bet: "
  bet = gets.to_f
  
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
    # to change it to cents
    personalFunds.add(bet * 100)
  else
    puts "You have lost #{bet}"
    # to change it to cents
    personalFunds.deduct(bet * 100)
  end
 

  print "Do you want to play again? [y, n]: "
  choice = gets.chomp.upcase

  break if choice == "N"
end
