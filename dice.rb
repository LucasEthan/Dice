class Dice
attr_reader :sides

  def initialize(sides)
    @sides = sides
  end

  def roll(number_of_rolls)
    rand(2..sides) * number_of_rolls
  end
end
