require 'pry'

class TicTacToe 
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
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
    puts "-----------"
  end
  
  def input_to_index(user_input)
    input = user_input.to_i-1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index_i)
    @board[index_i] == "X" || @board[index_i] == "O"
  end
    
    def valid_move?(index_i)
      @board.include?(@board[index_i]) && @board[index_i] == " "
    end
    
    def turn_count
      number_of_turns = 0 
      @board.each do |x|
        if x == "X" || x == "O" 
          number_of_turns+=1 
        end
      end
      number_of_turns
    end
    
    def current_player 
      if turn_count.even?
        "X"
      else
        "O"
      end
    end
    
    def turn 
      current_player
      puts "Please specify a position between 1-9"
      input = gets.chomp 
      index = input_to_index(input)
      if valid_move?(index)
        move(index)
        display_board
      else 
        turn
      end
    end

end





# def won?
#       WIN_COMBINATIONS.each do |array|
#         if @board.include?(array)
#           array 
#         else
#           false
#         end
#         binding.pry
#       end
#     end 










