class Word < ActiveRecord::Base

  def anagrams
    dictionary = Word.all.map{ |word| word.word }
    anagrams = []
    dictionary.each do |word|
      anagrams << word if is_anagram?(word)
    end
    return anagrams
  end

  private

  def is_anagram?(other_word)
    self.word.downcase.split('').sort.join == other_word.downcase.split('').sort.join
  end

  # def anagrams
  #   anagrams = []
  #   self.word.split("").permutation do |anagram|
  #     anagram = anagram.join.downcase
  #     dict_anagram = Word.where('lower(word) = ?', anagram).first
  #     anagrams << dict_anagram.word if dict_anagram
  #   end
  #   anagrams
  # end

end
