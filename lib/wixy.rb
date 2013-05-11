require 'wixy/version'
require 'wixy/config'
require 'wixy/vigenere'
require 'wixy/caesar'
require 'wixy/bifid'

module Wixy
  def self.encrypt(text, config = Config.new)
    new_cipher(config).encrypt(text)
  end

  def self.decrypt(text, config = Config.new)
    new_cipher(config).decrypt(text)
  end

  private
  def self.new_cipher(config)
    klass = config.cipher.to_s.capitalize
    self.const_get(klass).new(config)
  end
end
