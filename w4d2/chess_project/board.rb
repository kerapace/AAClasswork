require_relative 'piece'

class Board
    attr_reader :king, :pieces
    def initialize
        @grid = Array.new(8) {Array.new(8,NullPiece.instance)}
        @king = {}
        @pieces = {white: [], black: []}
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
        if !self[end_pos].empty?
            piece = self[end_pos]
            @pieces[piece.side].delete(piece)
        end
        self[start_pos], self[end_pos] = NullPiece.instance, self[start_pos]
        self[end_pos].position = end_pos
    end

    def in_check?(side)
        king_pos = @king[side].position
        other_side = side == :white ? :black : :white
        @pieces[other_side].any? {|piece| piece.moves.include?(king_pos)}
    end

    def checkmate?(side)
        other_side = side == :white ? :black : :white
        in_check(side) && @pieces[other_side].none? {|piece| piece.check_moves.empty?}
    end

    def try_move(start_pos, end_pos)
        check_side = self[start_pos].side
        if self[start_pos].is_a?(NullPiece)
            raise Exception.new("There's no piece to move!")
        elsif !self[start_pos].valid_move?(end_pos)
            raise Exception.new("This piece can't move there!")
        end
        temp = self[end_pos]
        if !self[end_pos].empty?
            piece = self[end_pos]
            @pieces[piece.side].delete(piece)
        end
        self[start_pos], self[end_pos] = NullPiece.instance, self[start_pos]
        self[end_pos].position = end_pos
        check_val = in_check?(check_side)
        @pieces[temp.side] << temp
        self[start_pos], self[end_pos] = self[end_pos], temp
        self[start_pos].position = start_pos
        check_val
    end

    private
    def set_up_board
        set_up_side(:white)
        set_up_side(:black)
    end

    def set_up_side(side)
        f, s = side == :white ? [0,1] : [7,6]
        (0..7).each do |j|
            self[[s,j]] = Pawn.new(side,self,[s,j])
            @pieces[side] << self[[s,j]]
        end
        (0..7).each do |j|
            if j == 0 || j == 7
                self[[f,j]] = Rook.new(side,self,[f,j])
            elsif j == 1 || j == 6
                self[[f,j]] = Knight.new(side,self,[f,j])
            elsif j == 2 || j == 5
                self[[f,j]] = Bishop.new(side,self,[f,j])
            elsif j == 3
                self[[f,j]] = Queen.new(side,self,[f,j])
            else
                self[[f,j]] = King.new(side,self,[f,j])
                @king[side] = self[[f,j]]
            end
            @pieces[side] << self[[f,j]]
        end
    end

    def inspect
        @grid
    end
end