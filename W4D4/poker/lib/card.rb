class Card
    include Comparable
    CARD_NUM = {A: 14, K: 13, Q: 12, J: 11, ten: 10, nine: 9, eight: 8, seven: 7, six: 6, five: 5, four: 4, three: 3, two: 2}
    attr_reader :suit, :rank

    def initialize(suit,rank)
        @suit = suit
        @rank = rank
    end

    def <=>(other)
        CARD_NUM[self.rank] <=> CARD_NUM[other.rank] 
    end
    
end