require 'benchmark'

def first_anagram(wrd1,wrd2)
    perms = wrd1.split("").permutation
    perms.include?(wrd2.split(""))
end

p first_anagram("art","rat")
p first_anagram("toad","doot")

def second_anagram(wrd1,wrd2)
    new_word_1 = wrd1.split("")
    new_word_2 = wrd2.split("")
    new_word_1.each do |chr|
        idx = new_word_2.index(chr)
        new_word_2.delete_at(idx) unless idx.nil?
    end
    new_word_2 == []
end

p second_anagram("art","rat")
p second_anagram("toad","doot")

def third_anagram(wrd1, wrd2)
    wrd1.split("").sort == wrd2.split("").sort
end


p third_anagram("art","rat")
p third_anagram("toad","doot")

def fourth_anagram(wrd1,wrd2)
    wrd_hash_1 = Hash.new(0)
    wrd_hash_2 = Hash.new(0)
    wrd1.each_char{|chr| wrd_hash_1[chr] += 1}
    wrd2.each_char{|chr| wrd_hash_2[chr] += 1}
    wrd_hash_1 == wrd_hash_2
end

p fourth_anagram("art","rat")
p fourth_anagram("toad","doot")