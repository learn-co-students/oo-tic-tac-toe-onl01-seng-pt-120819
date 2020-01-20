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

    def initialize
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
        puts "-----------"
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, player_token = "X")
        @board[index] = player_token
    end

    def position_taken?(index)
        @board[index] == "X" || @board[index] == "O"
    end

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
        turns = 0
        @board.each do |index|
            if index == "X" || index == "O"
                turns += 1
            end
        end
        turns
    end
    
    def current_player
        turn_count.even? == true ? "X" : "O"      
    end

    def turn
        puts "Please make a move by entering a number 1-9:"
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
        WIN_COMBINATIONS.detect do |win_combo|
            if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
                return win_combo

            elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
                return win_combo
            end

            false
        end
    end

    def full?
        @board.all? { |full| full != " "}
    end

    def draw?
        !won? && full?
    end

    def over?
        won? || full? || draw?
    end

    def winner
        winning_combo = won?
        if winning_combo
           return @board[winning_combo[0]]
        end
    end

    def play
        while over? == false
            turn
        end

        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
    
end
