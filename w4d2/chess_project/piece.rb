require 'board'

class Piece
    attr_accessor :position
    attr_reader :side

    def initialize(side, board, position)
        @side = side
        @board = board
        @position = position
    end

    def empty?
        return false
    end

    def valid_moves
    end

end

module Stepable
    def moves
        poss_moves = []
        curr_row, curr_col = self.position
        move_diffs.each do |row,col|
            poss_pos = [curr_row + row, curr_col + col]
            poss_moves << poss_pos if Board.valid_move?(poss_pos)
        end
        poss_moves
    end
    
    def move_diffs
        []
    end
end

module Slideable
end