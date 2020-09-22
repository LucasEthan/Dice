#!/usr/bin/env ruby

# require "craps_helper"
# require "craps"
# include CrapsHelper

craps = Craps.new
craps.play
craps.rolls
display_win_or_lose(craps.win_state)

def display_rolls
  craps.rolls.each do |roll|
  puts "You rolled #{roll}!"
  end
end
