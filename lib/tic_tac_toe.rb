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
    user_input.to_i-1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    ((@board[index] == "X") || (@board[index] == "O"))
  end
    
    def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
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
      puts "Please choose a number 1-9:"
      input = gets.chomp 
      index = input_to_index(input)
      player_token = current_player
      if valid_move?(index)
        move(index, player_token) 
        display_board
      else 
        turn
      end
    end
    
    def won?
      WIN_COMBINATIONS.detect do |array|
        if @board[array[0]] == "X" && @board[array[1]] == "X" && @board[array[2]] == "X"
          return array 
        elsif 
        @board[array[0]] == "O" && @board[array[1]] == "O" && @board[array[2]] == "O"
          return array
        end
          false
      end
    end 
    
    def full?
      @board.all? {|element| element == "X" || element == "O"}
    end
    
    def draw?
      !won? && full?
    end
    
    def over?
      !!won? || draw?
    end
    
    def winner
      WIN_COMBINATIONS.detect do |array|
        if @board[array[0]] == "X" && @board[array[1]] == "X" && @board[array[2]] == "X"
          return "X" 
        elsif 
        @board[array[0]] == "O" && @board[array[1]] == "O" && @board[array[2]] == "O"
          return "O"
        else
          nil
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
    end

    
end