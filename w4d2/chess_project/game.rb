require_relative "board"
require_relative "display"
require_relative "player"
class Game
    def initialize
        @board = Board.new
        @player1 = Player.new
        @player2 = Player.new
        @game_over = false
        @curr_player = @player1
    end

    def next_player
        @curr_player = @curr_player == @player1 ? @player2 : @player1
        
    end

    def play
        while !game_over

    end
end
