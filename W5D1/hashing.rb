class Array

end

class String #apple 

    def hash
        chr_array = self.split("") 
        chr_array.inject(0) {|acc, chr| acc ^ chr.ord ** 55 }.hash
    end

end

class Hash

    def hash
        sum = 0
        self.each {|k, v| sum += k.hash ^ v.hash ** 2}
    end

end