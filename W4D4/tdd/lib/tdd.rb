class Array

    def my_uniq
        unique_eles = Hash.new
        self.each { |ele| unique_eles[ele] = true }
        unique_eles.keys
    end

    def two_sum
        pairs = []
        (0...self.length-1).each do |i|
            (i+1...self.length).each do |j|
                pairs << [i,j] if self[i] + self[j] == 0
            end
        end
        pairs
    end
end

def my_transpose(mat)
    transposed = []
    (0...mat.length).each do |i|
        temp = []
        mat.each do |subarr|
            temp << subarr[i]
        end
        transposed << temp
    end
    transposed
end

# def stock_picker(arr)
#     minimum = 0
#     maximum = 1
#     diff = arr[1] - arr[0]
#     (0...arr.length).each do |i|
#         if i - minimum > 0 && arr[i] - arr[minimum] > diff
#             diff = arr[i] - arr[minimum]
#             maximum = i
#         elsif maximum - i > 0 && arr[maximum] - arr[i] > diff
#             diff = arr[maximum] - arr[i]
#             minimum = i
#         end
#     end
#     [minimum, maximum]
# end

def stock_picker(arr)
    days = []
    max = -1/0.0
    (0...arr.length-1).each do |i|
        (i+1...arr.length).each do |j|
            if arr[j] - arr[i] > max
                max = arr[j] - arr[i]
                days = [i,j]
            end
        end
    end
    days
end

class TowersOfHanoi
    attr_reader :towers, :size
    def initialize(size)
        @size = size
        @towers = Array.new(3) {[]}
        @towers[0] = (1..size).to_a.reverse
        # move(towers,0,2)
        # display(towers)
    end

    def display
        (size-1).downto(0).each do |i|
            puts (0...3).map {|a| self.towers[a][i].nil? ? " " : self.towers[a][i]}.join("|")
        end
        puts "====="
    end

    def move(first_tower, second_tower)
        unless self.towers[first_tower].empty?
            if self.towers[second_tower].empty? || self.towers[first_tower].last < self.towers[second_tower].last
                self.towers[second_tower].push(self.towers[first_tower].pop)
                return true
            end
        end
        return false
    end

    def won?
        self.towers[2].length == self.size
    end

    def play
        until self.won?
            self.display
            input = ""
            while !input.match(%r{^\d+,\d+$}) 
                puts "Please enter two numbers, separated by a comma"
                input = gets.chomp
            end
            start_pos, end_pos = input.split(",").map(&:to_i)
            move(start_pos,end_pos)
        end
        self.display
        puts "Congratulations!"
    end
end

# toh = TowersOfHanoi.new(3)
# toh.play