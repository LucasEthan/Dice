#!/usr/bin/env ruby

require_relative "craps_helper"
require_relative "craps"

include CrapsHelper

loop do
  craps = Craps.new
  puts "\nPress ENTER to play craps"
  gets
  craps.play
  craps.rolls.each do |roll|
    puts "You rolled #{roll}!"
  end

  display_win_or_lose(craps.win_state)
  puts "\n***** Number of games: #{Craps.number_of_games} *****"
  puts "***** Number of wins: #{Craps.wins} *****"
  puts "***** Number of losses: #{Craps.losses} *****"
  print "Do you want to play again? [y, n]: "
  choice = gets.chomp.upcase

  break if choice == "N"
end
