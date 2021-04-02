require_relative "board"
require_relative "tile"

class Game
    def initialize(grid_size=9, bomb_num = 15)
        @board = Board.new(grid_size, bomb_num)
    end

    def play
        has_not_lost = true
        while has_not_lost && !@board.solved?
            @board.render
            pos = get_input
            has_not_lost = @board.reveal(pos)
        end
        @board.render
        if !has_not_lost
            puts "You stepped on a mine!"
        elsif @board.solved?
            puts "You win!"
        end
    end

    def get_input
        input = ""
        until input.match(/^\d+,\d+$/) 
            puts "Please enter valid x- and y-coordinates (like '3,4')"
            input = gets.chomp
        end
        input.split(",").map(&:to_i)
    end
end

game = Game.new
game.play