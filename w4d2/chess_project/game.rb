require_relative "board"
require_relative "display"
require_relative "player"

class Game
    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @player1 = Player.new(:white,@display)
        @player2 = Player.new(:black,@display)
        @curr_player = @player1
    end

    def next_player
        @curr_player = @curr_player == @player1 ? @player2 : @player1 
    end

    def take_turn
        begin
            initial_position, final_position = @curr_player.get_input
            if @board[initial_position].side != @curr_player.side
                raise StandardError.new("Only move your own pieces, thanks!")
            end
            @board.move_piece(initial_position,final_position)
        rescue StandardError => e
            puts e.message
            retry
        end
        system("clear")
        @display.render
            
    end

    def play
        white_mate, black_mate = false, false
        system("clear")
        @display.render
        while !white_mate && !black_mate
            self.take_turn
            self.next_player
            white_mate, black_mate = @board.checkmate?(:white), @board.checkmate?(:black)
        end
    end
end

g = Game.new
g.play
