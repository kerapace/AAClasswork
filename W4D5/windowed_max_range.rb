def windowed_max_range(arr, window_length)
    curr_max_range = nil
    arr[0..arr.length-window_length].each_with_index do |ele, i|
        window = arr[i...i+window_length]
        range = window.max - window.min
        if curr_max_range.nil? || range > curr_max_range
            curr_max_range = range
        end
    end
    curr_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8

class MyStack
    def initialize
        @stack = []
    end

    def push(ele)
        @stack << ele
    end

    def pop
        @stack.pop
    end

    def peek
        @stack[-1]
    end

    def empty?
        @stack.length == 0
    end
end

class MyQueue
    def initialize
        @queue = []
    end

    def enqueue(ele)
        @queue << ele
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue[0]
    end

    def empty?
        @queue.length == 0
    end
end

# @stack1 = [3,2,1]
# O(n)
# @stack2 = [4,5,6] << 7

class StackQueue
    def initialize
        @stack1 = MyStack.new
        @stack2 = MyStack.new
    end

    def enqueue(ele)
        @stack2.push(ele)
        nil
    end

    def dequeue
        if !@stack1.empty?
            @stack1.pop
        else
            until @stack2.empty?
                @stack1.push(@stack2.pop)
            end
            @stack1.pop
        end
    end

    def empty?
        @stack1.empty? && @stack2.empty?
    end

    def peek
        @stack1.empty? ? @stack2[0] : @stack1[-1]
    end
end

# sq = StackQueue.new
# sq.enqueue(1)
# sq.enqueue(2)
# sq.enqueue(3)
# sq.enqueue(4)
# sq.enqueue(5)

# p sq.dequeue
# p sq.dequeue
# p sq.dequeue
# p sq.dequeue
# p sq.dequeue

class MinMaxStack
    def initialize
        @stack = []
        @max = -Float::INFINITY
        @min = Float::INFINITY
        @hash_max = Hash.new()
        @incidences = Hash.new(0)
        @hash_min = Hash.new()
    end

    def push(ele)
        @stack << ele
        @incidences[ele] += 1
        if ele > @max
            @hash_max[ele] = @max
            @max = ele 
        end
        if ele < @min
            @hash_min[ele] = @min
            @min = ele
        end
    end


    #[3,4,5,4,6,7}
    # { 3: nil, 4: 3, 5: 4, 7: 5, 6: 5}

    def pop
        if @stack.last == @max && @incidences[@max] == 1
            @max = @hash_max[@max]
        end
        if @stack.last == @min && @incidences[@min] == 1
            @min = @hash_min[@min]
        end
        @incidences[@stack.last] -= 1
        @stack.pop
    end

    def max
        @max
    end

    def min
        @min
    end

    def peek
        @stack[-1]
    end

    def empty?
        @stack.length == 0
    end
end

minmax = MinMaxStack.new
minmax.push(3)
minmax.push(4)
minmax.push(5)
minmax.push(2)
minmax.push(7)
minmax.push(7)
p minmax.max
minmax.pop
p minmax.max
minmax.pop
p minmax.max

