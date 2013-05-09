require 'wixy/config'

describe "Config" do
  describe "defaults" do
    subject(:config) { Wixy::Config.new }
    its(:shift)  { should eq(3) }
    its(:key)    { should eq("FORTIFICATION") }
    its(:cipher) { should eq(:caesar) }
  end

  context "with a block" do
    let(:key) { "KEY" }
    let(:shift) { 13 }
    subject(:config) {
      Wixy::Config.new do |config|
        config.key = key
        config.shift = shift
      end
    }

    its(:key) { should eq(key) }
    its(:shift) { should eq(shift) }
  end
end
