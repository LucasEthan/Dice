#!/usr/bin/env ruby

require "craps_helper"
require "craps"

include CrapsHelper

loop do
  craps = Craps.new
  puts "Prees ENTER to play craps"
  gets
  craps.play
  craps.rolls.each do |roll|
    puts "You rolled #{roll}!"
  end
  display_win_or_lose(craps.win_state)  
  puts "Do you want to play again? [y, n]"
  choice = gets.chomp.upcase

  break if choice == "Y"
end
