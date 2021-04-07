require_relative 'board.rb'
require 'singleton'
require 'byebug'

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

    def no_check_moves
        self.moves.select{|move| !self.move_into_check?(move)}
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

    def to_s
        self.sym.to_s
    end

    def sym
        raise Exception.new("Uninitialized symbol")
    end

    def inspect
        sym
    end

    def moves
        []
    end

    def move_into_check?(end_pos)
        new_board = self.board.dup
        new_board.move_piece!(self.position,end_pos)
        new_board.in_check?(self.side)
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

    def sym
        :N
    end
end

class King < Piece
    include Stepable
    def move_diffs
        [[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]]
    end

    def sym
        :K
    end
end

class Rook < Piece
    include Slideable
    def move_dirs
        HORIZONTAL_DIRS
    end

    def sym
        :R
    end
end

class Bishop < Piece
    include Slideable
    def move_dirs
        DIAGONAL_DIRS
    end

    def sym
        :B
    end
end

class Queen < Piece
    include Slideable
    def move_dirs
        HORIZONTAL_DIRS + DIAGONAL_DIRS
    end

    def sym
        :Q
    end
end

class Pawn < Piece
    include Stepable
    attr_reader :moved

    def initialize(side, board, position)
        @moved = false
        super
    end

    def position=(pos)
        @position = pos
        @moved = true
    end

    def valid_move?(pos)
        row, col = pos
        curr_row, curr_col = self.position
        return false unless row >= 0 && row < 8 && col >= 0 && col < 8
        # if self.move_into_check?(pos)
        #     return false
        # end
        if col - curr_col == 0
            if (curr_row - row).abs == 2
                return self.board[pos].empty? && self.board[[curr_row + forward_dir, col]].empty?
            else
                return self.board[pos].empty?
            end
        else
            return !self.board[pos].empty? && self.side != self.board[pos].side
        end
    end

    def forward_dir
        self.side == :white ? 1 : -1
    end

    def move_diffs
        r = self.forward_dir
        self.moved ? [[r, -1], [r, 0], [r, 1]] : [[r, -1], [r, 0], [r, 1], [2*r, 0]]
    end

    def sym
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

    def to_s
        " "
    end

    def sym
        :_
    end
end