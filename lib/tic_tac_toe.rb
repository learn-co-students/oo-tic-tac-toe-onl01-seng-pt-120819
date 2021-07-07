  require 'pry'
class TicTacToe
  
   def initialize
  # @board = board
   @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   end
   
  WIN_COMBINATIONS = [  
  [0,1,2], 
  [3,4,5],
  [6,7,8],
  
  
  [0 ,4 ,8],
  [2 ,4 ,6],
  [ 0, 3 ,6 ],
  
 [1 ,4 ,7],
  [2 ,5 ,8]
  
  
  ]
  
def display_board

puts" #{@board[0]} | #{@board[1]} | #{@board[2]} "
puts"-----------"
puts" #{@board[3]} | #{@board[4]} | #{@board[5]} "
puts"-----------"
puts" #{@board[6]} | #{@board[7]} | #{@board[8]} "
  
end

def input_to_index(string)
  string.to_i-1
 end
 
 
 def move(index, players_token = "X") 
  @board[index] = players_token
  end
  
  def position_taken?(index)
    
 if @board[index] == "X" || @board[index] == "O"
   TRUE
 else
   FALSE
     
 end
 end
 
 def valid_move?(index)
  !position_taken?(index) && index.between?(0, 8)
  
   
 end
 
    def turn_count
         counter = 0 
         @board.each do |spot| 
            if spot != " " && spot != "" 
              counter += 1
            end
        end
        counter
    end
    
    def current_player
      x_counter = 0
      o_counter = 0
        self.turn_count
      @board.each do |piece| 
        if piece == "X"
          x_counter += 1
          elsif piece == "O"
            o_counter += 1 
        end
      end
      if x_counter > o_counter 
        "O"
      else
        "X"
      end
    end
    
    def turn
    puts "1-9"
           user_input = gets.chomp
           index = input_to_index(user_input) 
    
    
  # valid_move?(index)
    # current_player
          if valid_move?(index)
              move(index, current_player) 
             else
             turn
           end
     display_board
     end

  
  
  def won?
       WIN_COMBINATIONS.any? do |combo|
         if @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] && position_taken?(combo[0])
           return combo
  
  
  #   == WIN_COMBINATIONS
            end
         end
           FALSE
  end
  
  
  
    def full?
      # @board.include?("X") && @board.include?("O") &&
      !@board.include?(" ")
    end
    
    def draw?
      
      full? && !won?
     end
      
      def over?
        draw? || won?
      end
      
       def winner 
        # WIN_COMBINATIONS.each do |combo| 
          
        #   if @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] && position_taken?(combo[0])
        #   binding.pry
        #   end
        if won? 
          @board[won?[0]]
          end
       end
         
         def play
        
             until over? do 
                 turn
             end
             
                if won? 
                  puts "Congratulations #{winner}!"
                  
                else 
                puts "Cat's Game!"
                end             
          end
  end
  
  
  
  
  
  
