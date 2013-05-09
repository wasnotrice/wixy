require_relative 'wixy/version'
require_relative 'wixy/config'
require_relative 'wixy/vigenere'
require_relative 'wixy/caesar'
require_relative 'wixy/bifid'

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
