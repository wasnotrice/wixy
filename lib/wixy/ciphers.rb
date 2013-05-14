module Wixy
  class Ciphers
    def self.include?(name)
      ciphers.include? name.to_sym
    end

    # An array of available ciphers
    def self.all
      [:caesar, :vigenere]
    end
  end
end
