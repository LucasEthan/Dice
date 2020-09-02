class Dice
attr_reader :number_of_rolls

  def initialize(sides)
    @sides = sides
  end

  def roll(number_of_rolls)
      puts rand(2..@sides) * number_of_rolls
  end
end
