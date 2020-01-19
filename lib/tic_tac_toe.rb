require 'pry'
class TicTacToe

  WIN_COMBINATIONS = []

attr_accessor :board

def initialize
  @board = [" "," "," "," "," "," "," "," "," "]
end
#binding.pry
WIN_COMBINATIONS =[
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [6,4,2]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(a)
      a.to_i - 1
end

def move (i, move = "X")
  @board[i] = move
end
# binding.pry
def position_taken?(i)
  @board[i] == " " ? false : true
end

def valid_move?(i)
  i.between?(0,8)  &&  !position_taken?(i)
#  @board[i] == " " ? true : false

end

def turn_count
  @board.count{|move| move == "X" || move == "O"}
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"

end

def turn
   puts "Please enter a number 1-9:"
    input = gets.strip
      i = input_to_index(input)
      cp = current_player
      if valid_move?(i)
        move(i, cp)
        display_board
      else
        turn
      end
  # binding.pry
end

end
