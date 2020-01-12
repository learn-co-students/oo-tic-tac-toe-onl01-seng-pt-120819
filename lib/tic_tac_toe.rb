require 'pry'
class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
    WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8], # Bottom row
    [0,4,8], # Diagnal
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
    ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(string)
    string.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(index)
    return nil if index < 0 || index > 8
    !position_taken?(index)
  end
  
  def turn
    puts "Make a move between 1 to 9"
    input = gets.chomp
    index  = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
    
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    winner = false
    WIN_COMBINATIONS.each do |combo|
      first_cell = @board[combo[0]]
      second_cell = @board[combo[1]]
      third_cell = @board[combo[2]]
      
      consideration = [first_cell, second_cell, third_cell]
      if consideration.uniq.size == 1
        return combo
      end
    end
    false
  end
  
  def full?
    @board.none? {|move| move == " "}
  end
  
  def draw?
    if full? && !won?
      return true
    end
    if won?
      return false
    end
    if !won? && !full?
      return false
    end
  end
  
  
  def over?
    if won? || full?
      return true
    end
  end
  
  def winner
    if won?
      return @board[won?[0]]
    end
    if !won?
      return nil
    end
  end
  
end
