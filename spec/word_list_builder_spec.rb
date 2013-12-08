require 'spec_helper'

describe WordListBuilder do
  describe "initialize" do
    before do
      @word_list = WordListBuilder.new(4, "./wordlist/test_word_list.txt")
    end

    it "should initilize correctly" do
      @word_list.word_length.should eq 4
    end
  end
end
