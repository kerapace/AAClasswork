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
    DIAGONAL_DIRS = [[1, 1], [-1, -1], [-1, 1], [1, -1]]
    HORIZONTAL_DIRS = [[0, 1], [0, -1], [1, 0], [-1, 0]]
    def move_dirs
        []
    end

    def moves
        poss_moves = []
        curr_row, curr_col = self.position
        move_dirs.each do |row,col|
            (1..7).each do |i|
                poss_pos = [curr_row + i * row, curr_col + i * col]
                if !@board[poss_pos].empty?
                    if @board[poss_pos].side != self.side
                        poss_moves << poss_pos if Board.valid_move?(poss_pos)
                    end
                    break
                end
                poss_moves << poss_pos if Board.valid_move?(poss_pos)

            end
        end
        poss_moves
    end

end