class Dice
attr_reader :timesroll

  def initialize(sides)
    @sides = sides
    @timesroll = timesroll
  end
  def roll(timesroll)
    if timesroll == 2 
    puts rand(2..12)
    end
    if timesroll == 6 
      puts rand(3..60)
    end
  end
end
