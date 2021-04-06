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

    def moves
        []
    end

end

module Stepable
    
end