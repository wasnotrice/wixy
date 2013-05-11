require 'wixy'

describe "Wixy" do
  let(:plaintext) { 'FORSAKINGMONASTICTRADITIONTWELVEJOVIALFRIARSGAVEUPTHEIRVOCATIONFORAQUESTIONABLEEXISTENCEONTHEFLYINGTRAPEZE' }
  let(:ciphertext) { 'IRUVDNLQJPRQDVWLFWUDGLWLRQWZHOYHMRYLDOIULDUVJDYHXSWKHLUYRFDWLRQIRUDTXHVWLRQDEOHHALVWHQFHRQWKHIOBLQJWUDSHCH' }

  describe "as a library" do
    let(:config) { Wixy::Config.new }

    it "encrypts" do
      result = Wixy.encrypt plaintext, config
      expect(result).to eq(ciphertext)
    end

    it "decrypts" do
      result = Wixy.decrypt ciphertext, config
      expect(result).to eq(plaintext)
    end
  end

  describe "CLI" do
    let(:wixy) { File.expand_path "../../bin/wixy", __FILE__ }

    # Hack to help the binary find library files. When installed as a
    # gem, rubygems takes care of this.
    before :all do
      @old_rubylib = ENV['RUBYLIB']
      ENV['RUBYLIB'] = File.expand_path "../../lib", __FILE__
    end

    after :all do
      ENV['RUBYLIB'] = @old_rubylib
    end

    it "encrypts" do
      result = `#{wixy} #{plaintext}`.chomp
      expect(result).to eq(ciphertext)
    end

    it "decrypts" do
      result = `#{wixy} --decrypt #{ciphertext}`.chomp
      expect(result).to eq(plaintext)
    end
  end
end
