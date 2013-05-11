Wixy is a library for playing with classical ciphers. These are the
ones you can work with pencil and paper. For starters, you can try:

- [Caesar cipher](https://en.wikipedia.org/wiki/Caesar_cipher)
- [Vigenère cipher](https://en.wikipedia.org/wiki/Vigen%C3%A8re_cipher)


## Installing

```
$ gem install wixy
```


## Getting started

You can use Wixy from the command line, like this:

```
$ wixy "my secret message"
$ wixy --decrypt --cipher vigenere --key pudding BSVHKEKIGHVANMT
$ wixy --help
```

or as a library, like this:

```ruby
require 'wixy'
config = Wixy::Config.new do |config|
  config.cipher = :vigenere
  config.key = "SUSHIFROGGY"
end

# Using the Wixy module
ciphertext = Wixy.encrypt("my secret message", config)
plaintext = Wixy.decrypt(ciphertext, config)

# The same thing, but using the underlying cipher instance
cipher = Wixy::Vigenere.new
ciphertext = cipher.encrypt("my secret message")
plaintext = cipher.decrypt(ciphertext)
```

## Contributing

Contributions are welcome! Pull requests with specs preferred :)

There are *loads* of cool ciphers around in addition to the few
supported at the moment.

Have fun!
