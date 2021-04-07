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
        self[start_pos], self[end_pos] = NullPiece.instance, self[start_pos]
        self[end_pos].position = end_pos
    end

    def in_check?(side)
        king_pos = @king[side].position
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
end

b = Board.new
p b.king
p b.pieces

