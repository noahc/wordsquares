class WordListBuilder
  attr_accessor :word_length, :words
  def initialize(word_length, words)
    self.word_length = word_length
    self.words = words
  end

  def word_stem_hash
    hashify_words_of_correct_length
  end

private
  def hashify_words_of_correct_length
    @word_stem_hash = Hash.new{[]}
    words.each do |w|
      hashify(w) if w.chomp!.length == word_length
    end
    @word_stem_hash
  end
  
  def hashify(word)
    word.length.times do |v|
      @word_stem_hash[word[0..v]] = @word_stem_hash[word[0..v]] << word
    end
  end
end
