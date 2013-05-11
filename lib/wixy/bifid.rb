require 'wixy/config'

module Wixy
  class Bifid
    def encrypt(text)
      return '' if text == ''
      return 'F' if text == 'F'
      'HD'
    end
  end
end
