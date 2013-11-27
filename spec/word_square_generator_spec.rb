require 'spec_helper'

describe WordSquareGenerator do
  before do
    @wsg = WordSquareGenerator.new(4, "test_word_list.txt")
  end

  describe "word_square_word_list" do
    it "should return the correct words" do
      @wsg.word_square_word_list.should eq(["card", "area", "rear", "dart"])
    end
  end

  describe 'render' do
    it "should render a proper 4x4 grid" do
      words = ["card", "area", "rear", "dart"]
      @wsg.render(words).should eq "card\narea\nrear\ndart"
    end
    it "should render a proper 6x6 grid" do
      words = ["garter", "averse", "recite", "tribal", "estate", "reeled"]
      @wsg.render(words).should eq "garter\naverse\nrecite\ntribal\nestate\nreeled"
    end
  end
end
