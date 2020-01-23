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
 def initialize
   @board = [" "," "," "," "," "," "," "," "," "]
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
 
 def move (i, move = "X")
  @board[i] = move
 end
 
 def position_taken?(i)
  @board[i] == " " ? false : true
 end
 
 def valid_move?(i)
  i.between?(0,8)  &&  !position_taken?(i)
 end
 
 def turn
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
    end 
      
  def turn_count
    counter = 0 
    @board.each do |token|
    if token == "X" || token == "O"
      counter += 1
    end  
  end 
  counter
 end
 
  def current_player
    if turn_count.even? 
      "X"
    else 
      "O"
    end 
  end 
  
  def won?
   WIN_COMBINATIONS.each do |combo|
     if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
        return combo
     end
    end
     return false
  end 
  
   def full?
    @board.all? do |combo|
    combo != " "
    end
  end  
  
   def draw?
    if self.full? && self.won?
    false 
   elsif !self.full? 
    false
   else
    true 
 
   end
  end 
  
   def over?
   if self.draw? || self.won?
    true
   end 
 end
 
  def winner

      if won?
     return @board[won?[0]]
     
   end

  end 
  
  def play 
   until over? do 
     turn 
  end 
  if won?
   puts "Congratulations #{winner}!"
  else draw?
   puts "Cat's Game!"
 end 
  end 
end
 
