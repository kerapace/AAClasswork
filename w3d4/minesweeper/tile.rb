class Tile

    attr_accessor :nearby_bombs

    def initialize(is_bomb)
        @is_bomb = is_bomb
        @revealed = false
        @nearby_bombs
    end

    def bomb?
        @is_bomb
    end

    def revealed?
        @revealed
    end

    def reveal
        @revealed = true
    end

    def display
        if @revealed
            @is_bomb ? "*" : @nearby_bombs.to_s
        else
            "#"
        end
    end
end