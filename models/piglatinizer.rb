class PigLatinizer

  def piglatinize(word)
    if capture = consonant_expression.match(word)
      capture.post_match.to_s + capture.to_s + 'ay'
    elsif vowel?(first_letter=word[0].downcase)
      word + 'way'
    end
  end

  def to_pig_latin(phrase)
    phrase.gsub('.','').split(' ').collect do |word|
      piglatinize(word)
    end.compact.join(' ')
  end
 
  private
  def consonant_expression
    /^ [^aeiou] {1,3}/ix
  end
 
  def vowel?(letter)
    vowels.include?(letter)
  end
 
  def vowels
    %w[a e i o u]
  end

end
