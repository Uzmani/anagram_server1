class Word < ActiveRecord::Base 

  before_save :save_canonical_representation

  def anagrams
    anagrams = Word.where('canonical_representation = ?', generate_canonical_representation)
    anagrams.map { |anagram| anagram.word }
  end

  def is_anagram?(other_word)
    canonical_representation == other_word.canonical_representation
  end

  private

  def save_canonical_representation
    self.canonical_representation = generate_canonical_representation
  end

  def generate_canonical_representation
    self.word.downcase.split('').sort.join
  end

end
