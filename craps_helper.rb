module CrapsHelper
  def display_win_or_lose(win)
    if win_state
      puts "You win"
    else
      puts "You lose"
    end
  end
end
