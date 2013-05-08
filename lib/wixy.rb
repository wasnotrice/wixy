require_relative 'wixy/version'
require_relative 'wixy/config'
require_relative 'wixy/vigenere'
require_relative 'wixy/caesar'
require_relative 'wixy/bifid'

module Wixy
  CIPHERS = [Bifid, Vigenere, Caesar]

  def self.encrypt(text, config = Config.new)
    cipher = config.cipher.new(config)
    cipher.encrypt(text)
  end

  def self.decrypt(text, config = Config.new)
    cipher = config.cipher.new(config)
    cipher.decrypt(text)
  end
end
