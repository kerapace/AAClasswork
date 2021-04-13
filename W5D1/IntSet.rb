class IntSet

    attr_reader :max_size
    def initialize(max_size)
        @max_size = max_size
        @buckets = Array.new(max_size) {Array.new}
    end

    def insert(num)
        @buckets[num%max_size] << num
    end

    def remove(num)
        @buckets[num%max_size].delete(num)
    end

    def include?(num)
        @buckets[num%max_size].include?(num)
    end
end

a = IntSet.new(10)
a.insert(6)
a.insert(16)
p a.include?(6)
p a.include?(16)
a.remove(6)
p a.include?(6)
p a.include?(16)
