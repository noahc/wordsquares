class WordSquareGenerator
  require 'pry'
  require 'pry-nav'
  require './lib/word_list_builder.rb'

  def initialize(n, file_location)
    @size_of_square = n
    @words = word_cleanup(File.open(file_location, &:readlines))
    @word_stem_hash = WordListBuilder.new(n, @words).word_stem_hash
    @word_list = nil
  end

  def word_square_word_list
    @words.each do |word|
      word = word.downcase.chomp
      break if @word_list
      solve_for_word_list([word]) if word.length == @size_of_square
    end
   @word_list || "No results found"
  end

private
  def solve_for_word_list(word_array)
    if word_array.length == @size_of_square
      @word_list = word_array
    elsif @word_list
    else
      next_words = @word_stem_hash[word_array.map{|w| w[word_array.length]}.join]
      next_words.each do |word|
        solve_for_word_list(word_array + [word])
      end
    end
  end

  def word_cleanup(readlines)
    readlines.select { |w| w.chomp.length == @size_of_square }
  end
end
