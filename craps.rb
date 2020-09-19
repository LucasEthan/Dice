class Craps
  require "dice"

  attr_reader :win_state, :rolls

  def initialize
    @rolls = []
    @win_state = nil
  end

  def play
    roll
    determine_win
    win_state
  end

  private

  attr_writer :win_state

  def last_roll
    rolls.last
  end

  def roll
    d6 = Dice.new(6)
    rolls << d6.roll(2)
  end

  def seven_eleven?
    last_roll == 7 || last_roll == 11
  end

  def craps?
    last_roll == 2 || last_roll == 3 || last_roll == 12
  end

  def determine_win
    if seven_eleven?
      self.win_state = true
    elsif craps?
      self.win_state = false
    else
      point = last_roll
      loop do
        roll
        if last_roll == point
          self.win_state = true
        elsif last_roll == 7
          self.win_state = false
        end
        break unless win_state.nil?
      end
    end
  end
end
