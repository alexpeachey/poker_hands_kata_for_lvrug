require_relative 'spec_helper'
require 'poker_hand_evaluator'

# Poker Hands are described as an array of 5 Cards.
# Cards are described by their Rank and Suit using 2 characters.
# Example: %w[ 7C 9D KH AS 2C ]
# A Card is greater than another card if it's Rank is greater.
# %w[ 2 3 4 5 6 7 8 9 T J Q K A ]
# The Poker Hand Evaluator should take two hands and declare which is the winner.
# Along with identifying the winner it should identify what type of hand.

# Poker Rankings from worst to best are:
# High card         %w[ 7C 9D KH AS 2C ]
# One Pair          %w[ 7C 7D KH AS 2C ]
# Two Pair          %w[ 7C 7D KH KS 2C ]
# Three of a Kind   %w[ 7C 7D 7H AS 2C ]
# Straight          %w[ 7C 8D 9H TS JC ]
# Flush             %w[ 7C 9C KC AC 2C ]
# Full House        %w[ 7C 7D 7H AS AC ]
# Straight Flush    %w[ 7C 8C 9C TC JC ]


describe PokerHandEvaluator do

  before :each do
    @evaluator = PokerHandEvaluator.new
    @high_card1 = %w[ 7C 9D KH AS 2C ]
    @high_card2 = %w[ 7H 9C KS 4S 2D ]
    @pair1 = %w[ 7C 7D KH AS 2C ]
    @pair2 = %w[ 8C 8D KS AH 2D ]
    @two_pair1 = %w[ 7C 7D KH KS 2C ]
    @two_pair2 = %w[ 7H 7S JH JS 2D ]
    @three_of_kind1 = %w[ 7C 7D 7H AS 2C ]
    @three_of_kind2 = %w[ TC TD TH AH 2D ]
    @straight1 = %w[ 7C 8D 9H TS JC ]
    @straight2 = %w[ 3C 4D 5H 6S 7D ]
    @flush1 = %w[ 7C 9C KC AC 2C ]
    @flush2 = %w[ 7H 9H KH 4H 2H ]
    @full_house1 = %w[ 7C 7D 7H AS AC ]
    @full_house2 = %w[ 5C 5D 5H JS JC ]
    @straight_flush1 = %w[ 7C 8C 9C TC JC ]
    @straight_flush2 = %w[ 3D 4D 5D 6D 7D ]
  end

  it "should determine which of two hands is the better high card hand" do
    @evaluator.hand_compare(@high_card1,@high_card2).should == 1
    @evaluator.hand_compare(@high_card2,@high_card1).should == -1
  end

  it "should be able to sort a hand" do
    @evaluator.hand_sort!(@high_card1).should == %w[ 2C 7C 9D KH AS ]
  end  

  it "should be able to compare two cards" do
    @evaluator.card_compare("5C","8D").should == -1
    @evaluator.card_compare("8D","5C").should == 1
    @evaluator.card_compare("JC","QH").should == -1
    @evaluator.card_compare("QH","KD").should == -1
  end

  it "should be able to determine the 'value' of a rank" do
    @evaluator.rank_value("5").should == 5
    @evaluator.rank_value("Q").should == 12
  end


end
