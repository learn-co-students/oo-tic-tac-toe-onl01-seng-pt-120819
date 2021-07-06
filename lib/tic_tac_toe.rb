class TicTacToe
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [2, 5, 8],
    [1, 4, 7],
    [6, 7, 8],
    [0, 1, 2],
    [3, 4, 5]
    ]
  
  def initialize(game)
    @game = game
  
  @board = [" "," "," "," "," "," "," "," "," "]
      end
  
  def display_board(board)
    @board = board
    row_index = 0
    while row_index < @board.length do
      puts "row #{row_index} has # { @board[row_index] } columns"
      column_index = 0
      while column_index < @board[row_index].length do 
        coord = "#{row_index}, #{column_index}"
        inner_len = @board[row_index][column_index].length
        puts "\t Coordinate [ #{coord} ] points to an
        #{ @board[row_index][column_index].class } at length
        #{inner_len}"
        inner_index = 0
        while inner_index < inner_len do
          puts "\t \t (#{coord}, #{inner_index}) is: #{ @board[row_index][column_index][inner_index] }"
          inner_index += 1
        end
        column_index += 1
      end
      row_index += 1
    end
    

  end
  
  def input_to_index(str)
    str.select { |s| s.to_i. i + 1 }
    puts "Display your input #{s}"
  end
    
    def move(index,token = x)
end

 def position_taken
 end

def valid_move
  present on the game board? "valid move" : "not a valid move"
end