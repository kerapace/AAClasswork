def four_sum(arr,target)
    hsh = Hash.new
    arr.each{|ele| hsh[ele] = true}
    arr.each_with_index do |ele1,i|
        arr[i+1..-1].each_with_index do |ele2,j|
            arr[i+1+j+1..-1].each do |ele3|
                if hsh[target-ele1-ele2-ele3]
                    return true
                end
            end
        end
    end
    false
end

p four_sum([1,3,5,7,9],20)
p four_sum([1,1,1,1,1],6)