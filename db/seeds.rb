
File.open('db/words', 'r').each_line do |word|
  word.rstrip!
  Word.create(word: word)
end
