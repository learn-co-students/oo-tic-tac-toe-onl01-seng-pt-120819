require 'pry'
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
  
  def move(ui, token)
    @board[ui] = token
  end
  
  def position_taken?(ui)
    if @board[ui]==" "
      return false
    else
      return true
    end
  end
  

  def valid_move?(ui)
    if !position_taken?(ui) && ui>-1 && ui<9
      return true
    else
      return false
    end
  end
  
  def turn
    puts "Enter an integer 1-9, representing your space on the board"
    user_input = gets.strip
    index=input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "Enter an integer 1-9, representing your space on the board"
      user_input = gets.strip
    end
  end
  
  def turn_count
    tc=0
    @board.each { |x|
    if x!=" "
      tc=tc+1
    end
    }
    return tc
  end
  
  def current_player
    if turn_count%2==0
      return "X"
    else
      return "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.each { |x|
    binding.pry
    if position_taken?(x[0])&&@board[x[0]]==@board[x[1]]&&@board[x[0]]==@board[x[2]]&&@board[x[1]]==@board[x[2]]
      return x
    else
      return false
    end
    }
  end
  
  def full?
    full=0
    @board.each { |x|
    if x=="X" || "O"
      full=full+1
    end
    }
    if full==9
      return true
    else
      return false
    end
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