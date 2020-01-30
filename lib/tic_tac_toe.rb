class TicTacToe
  user_input=" "
  token="X"
  def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [1,4,7],
  [2,4,6],
  [0,3,6],
  [2,5,8]
  ]

  def display_board
    puts" #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts"-----------"
    puts" #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts"-----------"
    puts" #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    real_ui = user_input.to_i - 1
  end
  
  def move(input_to_index, token)
    @board[input_to_index] = token
  end
  
  def position_taken?(input_to_index)
    if @board[input_to_index]==" "
      return false
    else
      return true
    end
  end
  
  def valid_move?(input_to_index)
    if !position_taken?(input_to_index) && input_to_index>-1 && input_to_index<9
      return true
    else
      return false
    end
  end
  
  def turn
    puts "Enter an integer 1-9, representing your space on the board"
    user_input = gets.strip
    user_input.input_to_index
    if valid_move?
      move
      display_board
    else
      puts "Enter an integer 1-9, representing your space on the board"
      user_input = gets.strip
    end
  end
  
  def turn_count
  end
  
  def current_player
  end
  
  def won?
  end
  
  def full?
  end
  
  def draw?
  end
  
  def over?
  end
  
  def winner
  end
  
  def play
  end

end