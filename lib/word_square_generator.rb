class WordSquareGenerator
  require 'pry'
  require 'pry-nav'

  def initialize(n, word_list_name)
    @size_of_square = n
    @word_list_name = word_list_name
    @word_list = word_list
    @generated_list = nil
  end

  def word_square_word_list
    @word_list.each do |word|
      possibilities = build_possibilities([[word]])
      unless possibilities.nil?
        possibilities.each do |p|
          @generated_list = p if is_list_valid?(p)
        end
      end
      break if @generated_list
    end
    return @generated_list || "No results found"
  end

  def build_possibilities(word_list)
    if word_list[0].length == @size_of_square
      return word_list
    else
      return_value = []
      word_list.each do |list|
        possible_next_words(list).each do |next_word|
          return_value << list + [next_word]
        end
      end
      build_possibilities(return_value) unless return_value == []
    end
  end

  def possible_next_words(list)
    start_of_next_word = list.map{|w| w[list.length]}.join
    get_all_words_that_start_with(start_of_next_word)
  end

  def get_all_words_that_start_with(string)
    return_array = []
    @word_list.each do |word|
      return_array << word if word.start_with?(string)
    end
    return_array
  end

  def is_list_valid?(list)
    (0..@size_of_square - 1).each do |n|
      (0..@size_of_square - 2).each do |m|
        return false if list[n][m] != list [m][n]
      end
     end
    @generated_list = list unless @generated_list
  end

  def word_list
    word_list = []
    file = File.open("wordlist/#{@word_list_name}")
    file.each_line do |line|
      if line.chomp!.length == @size_of_square
        word_list << line
      end
    end
    word_list
  end 
end
