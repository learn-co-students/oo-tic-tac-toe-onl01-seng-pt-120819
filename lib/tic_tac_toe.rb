class TicTacToe 

  def initialize
    @board = Array.new(9, ' ')
  end 

  WIN_COMBINATIONS = [
    [0, 1, 2],  
    [3, 4, 5],  
    [6, 7, 8],  
    [0, 3, 6],  
    [1, 4, 7],  
    [2, 5, 8],
    [6, 4, 2],
    [0, 4, 8]
  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
      user_input = input.to_i - 1 
  end
  
  def move(i, token="X") 
    @board[i] = token
  end 
  
  def position_taken?(index)
    if @board[index] == ' '
      return false 
    else 
      return true 
    end
  end 
  
  def valid_move?(position)
    if !position_taken?(position) && position.between?(0,8)
      return true
    else 
      return false 
    end 
  end 
  
  def turn_count 
    counter = @board.reject { |e| e.empty? || e == ' ' }
    p counter.length
  end 
  
  def current_player 
    if turn_count % 2 == 0  
      "X"
    else 
      "O"
    end
  end 
  
  def turn 
    puts "Pick a position from 1 to 9: "
    user_i = gets.chomp 
    user_i = input_to_index(user_i)
    if valid_move?(user_i)
      move(user_i, current_player)
      display_board
    else 
      turn 
    end
 
  end 
  
  def won? 
  WIN_COMBINATIONS.each do |combo|
    if ((@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X") ||
    (@board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"))
      return combo
      end
  end 
  return nil
  end 
  
  def full?
    !@board.any? {|e| e == " "}
  end 
  
  def draw?
    if !won? && full?
      true 
    else 
      false
    end 
  end 
  
  def over? 
    if draw? || won?
      true
    elsif full?
      false 
    end 
  end 
  
  def winner 
   won? ? @board[won?[0]] : nil
      
  end
  
  def play 
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
      elsif draw?
      puts "Cat's Game!"
    end
  end 
  
  
end 