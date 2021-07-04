require 'pry'

class TicTacToe
  def initialize(board=nil)
    @board = board || Array.new(9," ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [1,4,7],
    [2,4,6],
    [0,3,6],
    [2,5,8],
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
   input.to_i-1
  end
  
  def move(index, token)
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(index)
   index.between?(0,8) && !position_taken?(index)
  end
   
  def turn_count
    counter = 0
  @board.each do|token|
   if token == "X" || token == "O"
     counter += 1
   end
  end
    counter
  end
    
  def current_player
    turn_count % 2 == 0 ? "X":"O"
  end

  def turn
    puts "Please specify a number between 1-9"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
      if valid_move?(index)
       move(index, token)
       display_board
      else
     turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.find do |combination|
     if @board[combination[0]] == "X" &&  @board[combination[1]] == "X" && @board[combination[2]] == "X" || @board[combination[0]] == "O" &&  @board[combination[1]] == "O" && @board[combination[2]] == "O" 
        combination
     else
       false
      end
    end
  end
  
  def full?
    @board.all? do |slot|
      slot == "X" || slot == "O"
    end
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    draw? || won? 
  end
  
  def winner
   if combo = won?
     @board[combo.first]
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
  
  
end