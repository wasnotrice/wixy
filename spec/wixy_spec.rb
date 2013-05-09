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
