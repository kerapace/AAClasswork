require_relative 'tile.rb'

class Board
    def initialize(n, b)
        @grid = []
        tiles = Array.new(b) {Tile.new(true)} + Array.new(n * n - b) {Tile.new(false)}
        tiles.shuffle!
        n.times do
            @grid << tiles.shift(n)
        end
        add_nearby_bombs
    end

    def [](pos)
        x, y = pos
        @grid[x][y]
    end

    def reveal(pos)
        self[pos].reveal
        if self[pos].bomb?
            false
        else
            if self[pos].nearby_bombs == 0
                all_adjacent_tiles(pos).each {|pos| reveal(pos) if !self[pos].revealed?}
            end 
            true
        end
    end

    def solved?
        @grid.flatten.all? {|tile| tile.revealed? || tile.bomb?}
    end

    def all_adjacent_tiles(pos)
        i, j = pos
        [i,i+1,i-1].product([j,j+1,j-1])[1..-1].select{|a| a.all?{|k| k >= 0 && k < @grid.length}}
    end

    def render()
        @grid.each do |row|
            puts row.map{|tile| tile.display}.join("")
        end
        return nil
    end
    private
    def add_nearby_bombs
        (0...@grid.length).each do |i|
            (0...@grid[0].length).each do |j|
                @grid[i][j].nearby_bombs = all_adjacent_tiles([i,j]).count {|pos| self[pos].bomb?}
            end
        end
    end
end