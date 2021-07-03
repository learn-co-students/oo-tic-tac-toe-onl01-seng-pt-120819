# require 'pry'
# class TicTacToe
#
#   WIN_COMBINATIONS = []
#
# attr_accessor :board
#
# def initialize
#   @board = [" "," "," "," "," "," "," "," "," "]
# end
# #binding.pry
# WIN_COMBINATIONS =[
#    [0,1,2],
#    [3,4,5],
#    [6,7,8],
#    [0,3,6],
#    [1,4,7],
#    [2,5,8],
#    [0,4,8],
#    [6,4,2]
# ]
#
# def display_board
#   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
#   puts "-----------"
#   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
#   puts "-----------"
#   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
# end
#
# def input_to_index(a)
#       a.to_i - 1
# end
#
# def move (i, move = "X")
#   @board[i] = move
# end
# # binding.pry
# def position_taken?(i)
#   @board[i] == " " ? false : true
# end
#
# def valid_move?(i)
#   i.between?(0,8)  &&  !position_taken?(i)
# #  @board[i] == " " ? true : false
#
# end
#
# def turn_count
#   @board.count{|move| move == "X" || move == "O"}
# end
#
# def current_player
#   turn_count % 2 == 0 ? "X" : "O"
#
# end
#
# def turn
#    puts "Please enter a number 1-9:"
#     input = gets.strip
#       i = input_to_index(input)
#       cp = current_player
#       if valid_move?(i)
#         move(i, cp)
#         display_board
#       else
#         turn
#       end
#   # binding.pry
# end
#
# def won?
#   a = WIN_COMBINATIONS.find{
#      |combo|
#      @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
#    }
#    b = WIN_COMBINATIONS.find{
#      |combo|
#      @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
#    }
#    return a || b
# end
#
# def full?
#   !@board.any?{|x| x== "" || x == " "}
# end
#
# def draw?
#   !won? && full?
# end
#
# def over?
#   won? || draw?
# end
#
# def winner
#   if won?
#       @board[won?[0]] == "X" ? "X" : "O"
#     else
#       nil
#     end
# end
#
# def play
#   # @board = Array.new(9, " ")
#   until over? == true
#     turn
#   end
#   won? ? puts("Congratulations #{winner}!")  : puts("Cat's Game!")
#   #puts "Would you like to play again? (Y or N)"
#   #gets.strip.downcase == "y" || gets.strip.downcase == "yes" ? play : puts("Goodbye!")
# end
#
#
# # binding.pry
#
# end


class TicTacToe

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def initialize
@board = Array.new(9, " ")
end

def display_board
puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
puts "-----------"
puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
puts "-----------"
puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
user_input.to_i - 1
end

def move(index, current_player = "X")
@board[index] = current_player
end

def position_taken?(index)
!(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
index.between?(0,8) && !position_taken?(index)
end

def turn_count
turn = 0
@board.each do |index|
  if index == "X" || index == "O"
    turn += 1
  end
end
return turn
end

def current_player
#if the turn count is an even number, that means O just went, so the next/current player is X
num_turns = turn_count
if num_turns % 2 == 0
  player = "X"
else
  player = "O"
end
return player
end

def turn
<<<<<<< HEAD
   puts "Please enter a number 1-9:"
    input = gets.strip
      i = input_to_index(input)
      if valid_move?(i)
        cp = current_player
        move(i, cp)
        display_board
       else
        turn
      end
  # binding.pry
=======
puts "Please choose a number 1-9:"
user_input = gets.chomp
index = input_to_index(user_input)
if valid_move?(index)
  player_token = current_player
  move(index, player_token)
  display_board
else
  turn
end
end

def won?
WIN_COMBINATIONS.each {|win_combo|
  index_0 = win_combo[0]
  index_1 = win_combo[1]
  index_2 = win_combo[2]

  position_1 = @board[index_0]
  position_2 = @board[index_1]
  position_3 = @board[index_2]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combo
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combo
  end
}
return false
end

def full?
@board.all? {|index| index == "X" || index == "O"}
end

def draw?
if !won? && full?
  return true
else
  return false
end
end

def over?
if won? || draw?
  return true
else
  return false
end
end

def winner
index = []
index = won?
if index == false
  return nil
else
  if @board[index[0]] == "X"
    return "X"
  else
    return "O"
  end
end
end

def play
until over? == true
  turn
end

if won?
  puts "Congratulations #{winner}!"
elsif draw?
  puts "Cat's Game!"
end
>>>>>>> 87a98e1c44a30078c081c8a3f76abb50dbaa2c48
end

def won?
  a = WIN_COMBINATIONS.find{
     |combo|
     @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
   }
   b = WIN_COMBINATIONS.find{
     |combo|
     @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
   }
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
  until over?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end


# binding.pry

end
