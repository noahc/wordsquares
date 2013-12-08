require 'spec_helper'

describe WordSquareGenerator do
  describe "word_square_word_list" do
    
    it "should return the correct words" do
      @wsg = WordSquareGenerator.new(4, "./wordlist/test_word_list.txt")
      @wsg.word_square_word_list.should eq(["card", "area", "rear", "dart"])
    end

    it "should return the correct words" do
      @wsg = WordSquareGenerator.new(4, "./wordlist/test_word_list_invalid.txt")
      @wsg.word_square_word_list.should eq("No results found")
    end

  end
end
