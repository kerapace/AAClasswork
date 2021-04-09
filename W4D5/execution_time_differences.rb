require 'benchmark'

# def my_min(arr)
#     arr.each do |ele_1|
#         smallest = true
#         arr.each do |ele_2|
#             if ele_2 < ele_1
#                 smallest = false
#                 break
#             end
#         end
#         return ele_1 if smallest
#     end
# end

def my_min(arr)
    smallest = arr[0]
    arr.each do |ele|
        smallest = ele if ele < smallest
    end
    smallest
end

unsorted_arr = (0...1000).to_a.shuffle

# p my_min(unsorted_arr)

# def largest_contiguous_subsum(arr)
#     sum = 0
#     subarr = []
#     (0...arr.length).each do |i|
#         (i...arr.length).each do |j|
#             subarr << arr[i..j]
#         end
#     end
#     subarr.map(&:sum).max
# end
=begin
[8,7,-20,4,3,13]

=end


def largest_contiguous_subsum(arr)
    sum = 0
    max_sum = -Float::INFINITY
    # first_index = 0
    # last_index = 0
    (0...arr.length).each do |i|
        sum += arr[i] 
        if max_sum < sum
            max_sum = sum
        end
        sum = 0 if sum < 0 
    end
    max_sum
end

num_arr = [5,3,-7]

p largest_contiguous_subsum([5,3,-7])
p largest_contiguous_subsum([8,7,-20,4,3,13])
p largest_contiguous_subsum([-5,-1,-3])
