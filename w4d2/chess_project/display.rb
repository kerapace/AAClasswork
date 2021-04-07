require_relative 'cursor'
require_relative 'board'
require 'paint'
require 'byebug'

class Display
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
                    board_display += Paint[piece.to_s, piece.side, [254,242,141]]
                else
                    board_display += Paint[piece.to_s, piece.side, [199,159,3]]
                end
            end
            board_display += "\n"
        end
        puts board_display
    end
end

b = Board.new
d = Display.new(b)
b.move_piece([1,5],[2,5])
b.move_piece([6,4],[4,4])
d.render
b.move_piece([1,6],[3,6])
b.move_piece([7,3],[3,7])
d.render
p b.checkmate?(:white)