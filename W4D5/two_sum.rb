def bad_two_sum?(arr, target)
    (0...arr.length-1).each do |i|
        (i+1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target
        end
    end
    false
end

#bad_two_sum? time complexity O(n^2)

arr = [0,1,5,7]
p bad_two_sum?(arr, 6)
p bad_two_sum?(arr, 10)

def okay_two_sum?(arr, target)
    sorted_arr = arr.sort
    arr.each_with_index do |ele, i|
        unless ele * 2 == target 
            return true if bsearch(arr, target - ele )
        else
            return true if arr[i] == arr[i + 1]
        end
    end
    false
end

def bsearch(arr, target)
    start_index = 0
    end_index = arr.length
    while end_index - start_index > 0
        mid = (start_index + end_index) / 2
        if target == arr[mid] 
            return true
        elsif target > arr[mid]
            end_index = mid
        else
            start_index = mid + 1
        end
    end
    false
end

arr = [0,1,5,7]
p okay_two_sum?(arr, 6)
p okay_two_sum?(arr, 10)

def two_sum?(arr, target)
    hsh = {}
    arr.each do |ele|
        return true if hsh[target-ele]
        hsh[ele] = true
    end
    false
end

arr = [0,1,5,7]
p two_sum?(arr, 6)
p two_sum?(arr, 10)