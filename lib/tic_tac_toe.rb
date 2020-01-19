class TicTacToe
  def initialize
    @board = Array.new(9, " ")#[" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,4,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [6,4,2]
      ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "------------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "------------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i-1
  end

  def move(i, t = "X")
    @board[i] = t
  end

  def position_taken?(i)
    @board[i] != " "
  end

  def valid_move?(i)
    !position_taken?(i) && i.between?(0,8)
  end

  def turn
    puts "Enter a number(1-9):"
    user_input = gets.strip
    i = input_to_index(user_input)
    if valid_move?(i)
      t = current_player
      move(i, t)
    else
      turn
    end
    display_board
  end

  def turn_count
    @board.count{|spot| spot != " " }
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        return combo
      end
    end
  end

  def full?
    self.all?{|spot| spot != " " }
  end

  def draw?
    self.full? && !won?
  end

  def over?
    self.won? || draw?
  end

  def winner
    if combo = won?
      @board[combo[0]]
    end
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end
