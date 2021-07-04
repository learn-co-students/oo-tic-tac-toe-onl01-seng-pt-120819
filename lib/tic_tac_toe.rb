require "pry"

class TicTacToe
  attr_accessor :board
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
    
  def initialize
    #instance variable 
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display_board
    puts ' ' + @board[0] + ' | ' + @board[1] + ' | ' + @board[2] + ' '
    puts '-----------'
    puts ' ' + @board[3] + ' | ' + @board[4] + ' | ' + @board[5] + ' '
    puts '-----------'
    puts ' ' + @board[6] + ' | ' + @board[7] + ' | ' + @board[8] + ' '
  end
  
  def input_to_index(position)
    position = position.to_i
    position-1
  end
  
  def move(players_index, players_token="X")
    @board[players_index] = players_token
  end
  
  def position_taken?(position)
    if @board[position] == " "
      return false
    else 
      return true
    end
  end
  
  def valid_move?(position) #here position acts as synonym for index
    if (position <= 8 && position >= 0) && !(position_taken?(position)) 
      return true
    else 
      return false
    end
  end
  
  def turn
    puts "Enter position from 1 - 9" 
    position = gets.chomp
    position = position.to_i
    
    x = input_to_index(position)
    if valid_move?(x)
      y = current_player
      move(x, y)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    count = 0
    @board.each {|symbol|
      if !(symbol == " ")
        count+=1 
      end
    }
    return count
  end

  def current_player
    x = turn_count
    if x % 2 != 0
      return "O"
    else 
      return "X"
    end
  end
  
  def won? #won if values at WIN_COMBINATIONS are all the same
    WIN_COMBINATIONS.each {|combo| 
      if (@board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]) && (@board[combo[0]] != " ") 
        return combo
      end
    }
    return false #outside of loop!!!
  end
 
  def full?
    if !(@board.include?(" "))
      return true
    else 
      return false 
    end
  end
  
  def draw?
    if (full? == true && won? == false) 
      return true 
    elsif (won?) || (full? == false && won? == false) 
      return false 
    end
  end
  
  def over?
    if (won? || draw?) 
      return true
    else
      return false
    end
  end 

  def winner
    if won? == false 
      return nil
    else
      @board[won?[0]]
    end
  end

  def play 
    until over? 
      turn
    end
    
    if over? && winner
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end


        