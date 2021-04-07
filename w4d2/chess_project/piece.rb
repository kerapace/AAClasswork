require_relative 'board.rb'
require 'singleton'

# implement move_piece(end_pos)

class Piece
    attr_accessor :position
    attr_reader :side, :board

    def initialize(side, board, position)
        @side = side
        @board = board
        @position = position
    end

    def empty?
        return false
    end

    def valid_move?(pos)
        row, col = pos
        return false unless row >= 0 && row < 8 && col >= 0 && col < 8
        if !self.board[pos].empty?
            if self.board[pos].side == self.side
                return false
            end
        end
        true
    end

end

module Stepable
    def moves
        poss_moves = []
        curr_row, curr_col = self.position
        move_diffs.each do |row,col|
            poss_pos = [curr_row + row, curr_col + col]
            poss_moves << poss_pos if self.valid_move?(poss_pos)
        end
        poss_moves
    end
    
    def move_diffs
        []
    end
end

module Slideable
    DIAGONAL_DIRS ||= [[1, 1], [-1, -1], [-1, 1], [1, -1]]
    HORIZONTAL_DIRS ||= [[0, 1], [0, -1], [1, 0], [-1, 0]]
    def move_dirs
        []
    end

    def moves
        poss_moves = []
        curr_row, curr_col = self.position
        move_dirs.each do |row,col|
            (1..7).each do |i|
                poss_pos = [curr_row + i * row, curr_col + i * col]
                break if !self.valid_move?(poss_pos)
                poss_moves << poss_pos
                if !self.board[poss_pos].empty?
                    break
                end
            end
        end
        poss_moves
    end
end

class Knight < Piece
    include Stepable
    def move_diffs
        [[2,1],[1,2],[2,-1],[1,-2],[-1,2],[1,-2],[-1,-2],[-2,-1]]
    end

    def inspect
        :N
    end
end

class King < Piece
    include Stepable
    def move_diffs
        [[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]]
    end

    def inspect
        :K
    end
end

class Rook < Piece
    include Slideable
    def move_dirs
        HORIZONTAL_DIRS
    end

    def inspect
        :R
    end
end

class Bishop < Piece
    include Slideable
    def move_dirs
        DIAGONAL_DIRS
    end

    def inspect
        :B
    end
end

class Queen < Piece
    include Slideable
    def move_dirs
        HORIZONTAL_DIRS + DIAGONAL_DIRS
    end

    def inspect
        :Q
    end
end

class Pawn < Piece
    include Stepable
    def valid_move?(pos)
        row, col = pos
        _, curr_col = self.position
        return false unless row >= 0 && row < 8 && col >= 0 && col < 8
        if col - curr_col == 0
            return self.board[pos].empty?
        else
            return !self.board[pos].empty? && self.side != self.board[pos].side
        end
    end

    def move_diffs
        pawn_movement_dir = {black: -1, white: 1}
        r = pawn_movement_dir[self.side]
        [[r, -1], [r, 0], [r, 1]]
    end

    def inspect
        :p
    end
end

class NullPiece < Piece
    include Singleton

    def initialize
    end

    def empty?
        return true
    end

    def inspect
        :_
    end
end