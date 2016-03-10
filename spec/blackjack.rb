require_relative '../lib/deck'

class Blackjack
  def initialize(player_name)
    @player_name = player_name
  end

  def start
    @deck = Deck.new
    @deck.shuffle
    puts "Enter your name below."
    print ">> "
    @player_name = gets.chomp
    @dealer = "dealer"
    @ties = 0
    hit
  end

  def player_turn
    player_hand = []
    player_hand.push(@deck.draw)
    player_hand.push(@deck.draw)
    sum = 0
    p_hand_total = player_hand.each { |a| sum += a}
    puts "You have been given #{p_hand_total}."
    puts "Would you like to hit? (Y) or (N)"
    player_input = gets.chomp.upcase
    case player_input
      when "Y"
        player_hand.push(@deck.draw)
        new_p_hand_total = p_hand_total + @deck.draw
        puts "You now have #{player_hand}."
      when "N"
        dealer_turn
        puts "Your final total is #{p_hand_total}."
      end
    end
  end

  def dealer_turn
    dealer_hand = []
    dealer_hand.push(@deck.draw)
    dealer_hand.push(@deck.draw)
    sum = 0
    d_hand_total = player_hand.each { |a| sum += a}
    puts "The dealer's visible card is #{dealer_hand[0]}."
      if sum < 16
        dealer_hand.push(@deck.draw)
      else
        puts "The dealer's final total is #{d_hand_total}."
      end
    end
  end


  def calculate_winner(p_hand_total, d_hand_total)
    case
    when p_hand_total > d_hand_total
      puts "Congrats, #{@player_name}! You won!"
    when p_hand_total < d_hand_total
      puts "Sorry, #{@player_name}. You've been beaten by the dealer."
    when p_hand_total > 21 && d_hand_total < 21
      puts "Sorry, #{@player_name}. You busted. Dealer wins."
    when p_hand_total < 21 && d_hand_total > 21
      puts "Congrats, #{@player_name}. The dealer busted. You win."
    when p_hand_total > 21 && d_hand_total > 21
      puts "Oops. You both busted. No one wins."
    end
  end
end

round1 = new.Blackjack
puts round1
