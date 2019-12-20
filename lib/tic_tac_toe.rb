class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input = input.to_i - 1 
  end
  
  def move(index, token = "X")
    @board[index] = token 
  end
  
  def position_taken?(index)
    #!(@board[index].nil? || @board[index] == " ")
    @board[index] == nil || @board[index] == " " ? false : true 
  end
  
  def valid_move?(position)
    !position_taken?(position) && @board[position] ? true : false 
  end
  
  # def turn 
  # puts "Enter a number from 1 to 9"
  # input = gets.chomp 
  # input_to_index(input)
  # valid_move?(input)
  # current_player 
  # end
  
  def turn_count
    @board.count {|index| index != " "}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn 
    puts "Please enter a number from 1 to 9"
    input = gets.chomp 
    input = input_to_index(input)
    
    valid_move?(input) ? move(input, current_player) && display_board : turn 
  end
  
end









