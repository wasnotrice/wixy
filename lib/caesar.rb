class Alphabet
  # chars is an array of character strings, like ["A", "B", "C" ...]
  def initialize(chars, options = {})
    @chars = chars.to_a.rotate(options[:shift] || 0)
    @index = Hash[@chars.each_with_index.to_a]
  end

  def [](index)
    @chars[index]
  end

  def index(char)
    i = @index[char]
  end

  def sanitized_chars(text)
    text.upcase.chars.map { |c| char_if_present(c) }.compact
  end

  # Given a char and another alphabet, find the char in this alphabet
  # at the corresponding index in this alphabet
  def char(char, other_alphabet)
    self[other_alphabet.index(char)]
  end

  def to_s
    "<Alphabet:[#{@chars.join}]>"
  end

  private
  def char_if_present(char)
    char if index(char)
  end
end


class Caesar
  def initialize(shift)
    @text_alphabet = Alphabet.new ("A".."Z")
    @cipher_alphabet = Alphabet.new ("A".."Z"), shift: shift
  end


  def encrypt(text)
    substitute(text, @text_alphabet, @cipher_alphabet)
  end

  def decrypt(text)
    substitute(text, @cipher_alphabet, @text_alphabet)
  end

  private
  def substitute(text, source_alphabet, target_alphabet)
    source_alphabet.sanitized_chars(text).map do |char|
      target_alphabet.char(char, source_alphabet)
    end.join
  end
end
