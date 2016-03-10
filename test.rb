class Deck
  def initialize
    @cards = []
    ranks = %w{ A 2 3 4 5 6 7 8 9 10 J Q K}
    suits = %w{Spades Hearts Di♠amonds Clubs}

    suits.each do |suit|
      (ranks.size).times do |i|
        @cards.push(Card.new(ranks[i], suit, (i+1)))
      end
    end
  end

  def shuffle!
    @cards.shuffle!
  end

  def draw
    @cards.pop
  end

  def remaining
    @cards.length
  end
end

deck = Deck.new
deck.shuffle!
puts deck.draw
puts deck.remaining
