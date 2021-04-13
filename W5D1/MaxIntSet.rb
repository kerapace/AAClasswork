class MaxIntSet

    def initialize(max)
        @max = max
        @table = Array.new(max, false)
    end

    def insert(int)
        raise "Number too big" if int >= @max
        @table[int] = true
    end

    def remove(int)
        raise "Number too big" if int >= @max
        @table[int] = false
    end

    def include?(int)
        raise "Number too big" if int >= @max
        @table[int]
    end

end

# a = MaxIntSet.new(10)
# a.insert(12)
# p a.include?(6)
# a.remove(6)
# p a.include?(6)


