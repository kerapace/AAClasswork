class Player
    attr_reader :side, :cursor
    def initialize(p_side,display)
        @side = p_side
        @display = display
        @cursor = display.cursor
    end

    def get_input
        init_loc, final_loc = nil, nil
        # system("clear")
        # @display.render
        while init_loc.nil? || final_loc.nil?
            val = cursor.get_input
            if init_loc.nil?
                init_loc = val
            elsif final_loc.nil?
                final_loc = val
            end
            system("clear")
            @display.render
        end
        [init_loc, final_loc]
    end
end