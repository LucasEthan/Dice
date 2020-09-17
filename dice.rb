class Dice
  attr_reader :sides

  def initialize(sides)
    @sides = sides
    @roll = roll
  end

  def roll(number_of_rolls = 1)
    roll = 0 # accumulator
    number_of_rolls.times { roll += rand(1..sides) }
    roll
  end

  if win = true
    puts "You win!"
  elsif win = false
    puts "You lose!"
  end

  if roll == 7 || roll == 11
    win = true
  elsif roll == 2 || roll == 3 || roll == 12
    win = false
  else
    point = roll
    loop do
      roll = d6.roll(2)
      if point == roll
        win = true
        break
      elsif point == 7
        win = false
        break
      end
    end
  end
end
