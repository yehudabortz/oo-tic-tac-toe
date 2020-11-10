require 'pry'   
class TicTacToe
    
      def initialize(board = nil)
        @board = board || Array.new(9, " ")
      end

      WIN_COMBINATIONS = [
          [0,1,2],
          [3,4,5],
          [6,7,8],
          [0,3,6],
          [1,4,7],
          [2,5,8],
          [0,4,8],
          [6,4,2],
      ]

      def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      end

      def input_to_index(input)
        index = input.to_i - 1
      end

      def move(index, token = "X")
       @board[index] = token
      end

      def position_taken?(index)
        @board[index] != " "
      end

      def valid_move?(index)
        if index != 0..8 && @board[index] != " "
            false
        else 
            true
        end
      end

      def turn_count
        total_turns = 0
        @board.each do |i|
            if i != " "
            total_turns += 1
            end
        end
        total_turns
      end

      def current_player
        if turn_count.even?
           token = "X"
        else
           token = "O"
        end
        token
     end

      def turn
        puts "Please select a number 1-9."
        input = gets
        index = input_to_index(input)

        if valid_move?(index)
            move(index, current_player) 
            display_board
        else
            turn
        end
      end

      # If the indices of of all WIN_COMBINATIONS do need equal either X or O then Draw

      def won?
        WIN_COMBINATIONS.find do |sub_array|
            position_taken?(sub_array[0]) && @board[sub_array[0]] ==  @board[sub_array[1]] &&  @board[sub_array[2]] == @board[sub_array[0]]
        end
      end

      def full?
        @board.all? {|space| space != " "}
      end

      def draw?
        full? && !won?
      end

      def over?
        won? || draw?
    end
    
    def winner
        winner = WIN_COMBINATIONS.find do |sub_array|
            @board[sub_array[0]] ==  @board[sub_array[1]] &&  @board[sub_array[2]] == @board[sub_array[0]]
        end
        # binding.pry
        if @board[winner[0]] == "X"
            "X"
        elsif @board[winner[0]] == "O"
            "O"
        else
            nil
        end
      end

    def play
        

    
    def play
        until over?
            turn
            if over?
                if won?
                    "Congratulations #{winner}!"
                   else
                    "Cats Game!"
                end
            end
        end
    end
end
