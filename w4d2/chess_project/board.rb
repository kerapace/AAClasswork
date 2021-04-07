require_relative 'piece'

class Board
    def initialize
        @grid = Array.new(8) {Array.new(8,NullPiece.instance)}
        set_up_board
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        if self[start_pos].is_a?(NullPiece)
            raise Exception.new("There's no piece to move!")
        elsif !self[start_pos].valid_move?(end_pos)
            raise Exception.new("This piece can't move there!")
        end
        self[start_pos], self[end_pos] = NullPiece.instance, self[start_pos]
        self[end_pos].position = end_pos
    end

    private
    def set_up_board

    end
end

