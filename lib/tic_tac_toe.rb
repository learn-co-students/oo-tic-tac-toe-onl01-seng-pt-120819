require 'pry'
class TicTacToe
  
  WIN_COMBINATIONS = [
        [0,1,2],[3,4,5], [6,7,8],[0,3,6],
        [1,4,7], [2,5,8],[0,4,8],[2,4,6]
        ]
  def initialize(board = nil)
    @board =board || Array.new(9," ")
  end  
  
  def display_board
       puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
       puts "-----------"
       puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
       puts "-----------"  
       puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  
  def input_to_index(play)
      play.to_i - 1
  end 
  
  def move(index, token = nil)
      @board[index] = token 
  end 
  def position_taken?(taken_space)
      @board[taken_space] != " "
  end 
  
  def valid_move?(open_space)
      open_space.between?(0,8) && !position_taken?(open_space)
  end 
  
  def turn_count
      play_counter = 0 
      @board.each do |each_play|
        if each_play == "X" || each_play == "O"
          play_counter +=1
        end 
      end
      play_counter 
  end 
  
  def current_player
        if turn_count.even?
          "X"
        else 
          "O"
        end 
  end 
  
  def turn 
        puts "Choose a number between 1-9"
        play = input_to_index(gets.chomp)
       if valid_move?(play)
         move(play, current_player)
          display_board
        else 
          turn
       end
  end 
  
  def won?
        winner = nil 
        WIN_COMBINATIONS.each do |combo|
        if combo.all? {|moves| @board[moves] == "X"}
          winner = combo 
         elsif combo.all? {|moves| @board[moves] == "O"}
          winner = combo 
          end 
        end 
        winner
  end 
  
  def full?
      turn_count == 9
  end 
  
  def draw?
      full? && !won?
  end 
  
  def over?
    draw? || won?
  end 
  
  def winner
    if  won? 
      @board[won?[0]]
    end 
   
  end 
  
  def play 
       turn until over?
          if winner
            puts "Congratulations #{winner}!"
          else 
            puts "Cat's Game!"
          end  
      end
end 





