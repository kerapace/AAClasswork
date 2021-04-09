require_relative 'cursor'
require_relative 'board'
require 'paint'
require 'byebug'

class Display
    attr_reader :cursor
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0],board)
    end

    def render
        board_display = ""
        cursor_piece = @board[@cursor.cursor_pos]
        poss_moves = cursor_piece.moves
        (0..7).each do |i|
            (0..7).each do |j|
                # if cursor_pos == [i,j] then the background should be green
                # if [i,j] is in @board[cursor_pos].moves then the background should be light red
                # if neither, then if i + j is odd or even, colors should be tan and brown
                piece = @board[[i,j]]
                if [i,j] == @cursor.cursor_pos
                    board_display += Paint[piece.to_s, piece.side, :green]
                elsif poss_moves.include?([i,j])
                    board_display += Paint[piece.to_s, piece.side, [139,247,250]]
                elsif (i + j) % 2 == 0
                    board_display += Paint[piece.to_s, piece.side, [119,119,119]]
                else
                    board_display += Paint[piece.to_s, piece.side, [170,170,170]]
                end
            end
            board_display += "\n"
        end
        puts board_display
    end
end