#!/usr/bin/env ruby

require "craps_helper"
include CrapsHelper

craps = Craps.new
win_state = craps.play
display_win_or_lose(win_state)
