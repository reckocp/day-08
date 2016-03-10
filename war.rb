class Card
  def initialize (suit, value)
    @suit = suit
    @value = value
  end

  def card_deck
    suits = [:hearts, :diamonds, :spades, :clubs]
    suits.each do |suit|
      (2..14).each do |value|
        @cards << Card.new(suit, value)
      end
    end
  end

  def display_value
    case @value
    when 11 then "J"
    when 12 then "Q"
    when 13 then "K"
    when 14 then "A"
    else
      @value
    end
  end

end  
