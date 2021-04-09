require_relative 'deck'

class Hand
    include Comparable
    HAND_TYPES = [straight_flush: 7, four_of_a_kind: 6, full_house: 5, flush: 4, straight: 3, three_of_a_kind: 2 two_pair: 1 one_pair: 0 high_card: -1]
    def initialize(deck)
        @hand = []
        @deck = deck
    end

    def draw_hand
        @hand << @deck.draw(5)
    end

    def discard(crd)
        @hand.delete(crd)
        @deck.discard(crd)
    end

    def redraw(hnd_hsh)
        @hand.each {|crd| discard(crd) if !hnd_hsh[crd] }
        @hand << @deck.draw(5-hand.size)
    end

    def straight_flush
        
    end

    def flush
        @hand.all?{|crd| crd.suit == @hand[0].suit}
    end

    # def straight
    #     @hand.sort
    #     init_rank = @hand[0]
    #     is_straight = true
    #     (1...@hand.length).each do |i|
    #         if i == @hand.length - 1 && @hand[0] == 2
    #         if hand[i].rank != hand[i-1] + 1
    #             is_straight = false
    #             break
    #         end
    #     end
    #     is_straight
    # end

    def <=>(other)

    end
end