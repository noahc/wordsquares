wordsquares
===========

Word Squares Generator

To Use
====

```
beginning_time = Time.now; 
require './lib/word_square_generator'; 
@wsg = WordSquareGenerator.new(6, "./wordlist/words.txt"); 
@wsg.word_square_word_list; 
end_time = Time.now; 
puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"
```

You can change the '6' to any number to represent the length. There are multiple dictionaries that are included or you can add your own in the wordlist directory and then pass in the name as the second param.
