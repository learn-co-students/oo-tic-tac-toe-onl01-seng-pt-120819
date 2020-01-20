require 'pry'
class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

    WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8], # Bottom row
    [0,4,8], # Diagnal
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
    ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(string)
    string.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    # return nil if index < 0 || index > 8
    # !position_taken?(index)

    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9"
    input = gets.chomp
    index  = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end


  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player

    turn_count % 2 == 0 || turn_count == 0 ? "X" : "O"
  end

  def won?

    WIN_COMBINATIONS.detect do |combo|
      first_cell = @board[combo[0]]
      second_cell = @board[combo[1]]
      third_cell = @board[combo[2]]

      first_cell == "X" && second_cell == "X" && third_cell == "X" ||
      first_cell == "O" && second_cell == "O" && third_cell == "O"
    end
  end

  def full?
    @board.none? {|move| move == " "}
  end

  def draw?
    !won? && full?
  end

  def over?

    draw? || won?
  end

  def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end
  end

  def play

    until over?
      turn
    end
    if won?
    puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
