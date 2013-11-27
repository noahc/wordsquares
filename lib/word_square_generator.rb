class WordSquareGenerator
  require 'pry'
  require 'pry-nav'

  def initialize(n, word_list_name)
    @size_of_square = n
    @word_list_name = word_list_name
    @word_list = word_list
  end

  def render(words)
     p words.join("\n")
  end

  def word_square_word_list
    @word_list.each do |word|
      get_all_words_that_start_with(word[1]).each do |word2|
        get_all_words_that_start_with(word[2]+word2[2]).each do |word3|
          get_all_words_that_start_with(word[3]+word2[3]+word3[3]).each do |word4|
            list = [word, word2, word3, word4]
            return list if is_list_valid?(list)
          end
        end
      end
    end
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
    true
  end

  def build_word_list_based_on_word(word)
    list = []
    @word_list.each do |word_list_word| 
      binding.pry
      next unless word_list_word.start_with?(*word[1..-1].scan(/./))
      include_count = 0
      word.scan(/./).each do |char|
        if word_list_word.count(char).to_i >= 1
          include_count = include_count + 1
        end
        break if include_count >= 2
      end
      if include_count >= 2
        list << word_list_word
      end
    end
    list
  end

#private
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

