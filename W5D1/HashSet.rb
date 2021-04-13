class HashSet

    def initialize(init_size)
        @curr_size = init_size
        @buckets = Array.new(init_size) {[]}
        @element_num = 0
    end

    def insert(el)
        if @element_num >= @curr_size
            resize
        end
        if !self.include?(el)
            @buckets[el.hash % @curr_size] << el
            @element_num += 1
        end
    end

    def remove(el)
        if self.include?(el)
            @buckets[el.hash % @curr_size].delete(el)
            @element_num -= 1
        end
    end

    def include?(el)
        @buckets[el.hash % @curr_size].include?(el)
    end

    private
    def resize
        old_buckets = @buckets.dup
        @buckets = Array.new(@curr_size*2) {[]}
        @curr_size *= 2
        old_buckets.flatten.each {|ele| @buckets[ele.hash % @curr_size] << ele}
    end
end

a = HashSet.new(4)
a.insert(91)
a.insert([])
a.insert({a: "drumstick"})
a.insert("dumpling")
a.insert("hash")

p a.include?(91) #true
a.insert(6)
a.remove([])
p a.include?({a: "drumstick"}) # true
p a.include?("DUMPLING") # false
p a.include?("hash") #true
p a.include?([])  #false