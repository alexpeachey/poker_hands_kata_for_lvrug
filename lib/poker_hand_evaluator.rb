class PokerHandEvaluator

  def hand_compare(hand1,hand2)
    hand_sort!(hand1)
    hand_sort!(hand2)
    4.downto(0) do |n|
      result = card_compare(hand1[n],hand2[n])
      return result if result != 0
    end

    0
  end

  def hand_sort!(hand)
    hand.sort! { |x,y| card_compare(x,y) }
  end

  def card_compare(card1,card2)
    rank_value(card1[0]) <=> rank_value(card2[0])
  end

  def rank_value(rank)
    ranks = %w[ 2 3 4 5 6 7 8 9 T J Q K A ]
    ranks.index(rank) + 2
  end
end