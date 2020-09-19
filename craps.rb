class Craps
  require "dice"

  attr_reader :win_state, :rolls

  def play
    roll
  end

  private

  def roll
    d6 = Dice.new(6)
    roll = d6.roll(2)
  end
end

