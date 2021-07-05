



## Ask Annabel on a 1 x 1 to explain this lab even further with me


class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2], #Top Row
    [3,4,5], #Middle Row
    [6,7,8], #Bottom Row
    [0,3,6], #Left Column
    [1,4,7], #Middle Column
    [2,5,8], #Rigth Column
    [0,4,8], #Diagnal 1
    [2,4,6], #Diagnal 2
  ]

def initialize(board = nil)
  @board = board || Array.new(9, " ")
end

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(index)   ### Need a further more explanation towards this to undersand it more
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end


def turn_count
   ## Also, explain to me how this method works within the game itself
  @board.count{ |token| token != " "}
   ##Need help on this one
end


def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn
  puts "Please enter 1 - 9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def won?
  # WIN_COMBINATIONS.detect do |win_combo| #Need assistance in understanding this method
    a = WIN_COMBINATIONS.detect{|combo| @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"}
    b = WIN_COMBINATIONS.detect{|combo| @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"}

    return a || b
end

def full?
  !@board.any?{|x| x== "" || x == " "}
end

def draw?
  !won? && full?
end

def over?
  won? || draw?
end

def winner
  if won?
    @board[won?[0]] == "X" ? "X" : "O"
  else
    nil
  end
end

def play
  # @board = Array.new(9, " ")
  # turn until  over?
  # won? ? puts("Congratulations #{winner}!") : puts("Cat's Game!")
  # puts "Would you like to play again? (Y or N)"
  # gets.strip.downcase == "y" || gets.strip.downcase == "yes" ? play :
  # puts("Goodbye!")

  until over?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  else
  end


end

end
