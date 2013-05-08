require_relative 'wixy/version'
require_relative 'wixy/vigenere'
require_relative 'wixy/caesar'
require_relative 'wixy/bifid'

module Wixy
  CIPHERS = [:bifid, :caesar, :vigenere]
end
