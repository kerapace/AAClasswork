require_relative 'piece'

class Board
    def initialize
        @grid = Array.new(8) {Array.new(8,:empty)}
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
        if self[start_pos] == :empty
            raise Exception.new("There's no piece to move!")
        # elsif self[start_pos].valid_move?(start_pos,end_pos)
        #     raise Exception.new("This piece can't move there!")
        end
        self[start_pos], self[end_pos] = :empty, self[start_pos]
    end

    def self.valid_move?(pos)
        row, col = pos
        row >= 0 && row < 8 && col >= 0 && col < 8
    end
    private
    def set_up_board

    end
end

