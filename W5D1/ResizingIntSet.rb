class ResizingIntSet

    def initialize(init_size)
        @curr_size = init_size
        @buckets = Array.new(init_size) {[]}
        @element_num = 0
    end

    def insert(num)
        if @element_num == @curr_size
            resize
        end
        if !self.include?(num)
            @buckets[num % @curr_size] << num
            @element_num += 1
        end
    end

    def remove(num)
        if self.include?(num)
            @buckets[num % @curr_size].delete(num)
            @element_num -= 1
        end
    end

    def include?(num)
        @buckets[num % @curr_size].include?(num)
    end

    def inspect
        @buckets.flatten
    end

    private
    def resize
        puts "Resizing from #{@curr_size} to #{@curr_size*2}"
        old_buckets = @buckets.dup
        @buckets = Array.new(@curr_size*2) {[]}
        @curr_size *= 2
        old_buckets.flatten.each {|ele| @buckets[ele % @curr_size] << ele}
    end
end

a = ResizingIntSet.new(4)
a.insert(91)
a.insert(-3)
a.insert(21)
a.insert(52)
a.insert(21)

p a.include?(21) #true
a.insert(6)
a.remove(21)
p a.include?(21) # false
p a.include?(91) # true
p a.include?(-3) # true
p a.include?(7)  #false