require_relative "card"

SUITS = [:hearts, :diamonds, :spades, :clubs]
RANKS = Card::CARD_NUM.keys

class Deck
    def initialize(num = 1)
        @deck = []
        @discarded = []
        num.times do
            populate_deck
        end
        @deck.shuffle!
    end

    def discard(card)
        @discarded << card
    end

    def reshuffle
        @deck += @discarded
        @deck.shuffle! 
        @discarded = []
    end

    def draw(num_of_cards)
        @deck.pop(num_of_cards)
    end

    private
    def populate_deck
        RANKS.each do |rank|
            SUITS.each do |suit|
                @deck << Card.new(suit,rank)
            end
        end
    end
end