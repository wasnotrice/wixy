require 'wixy/alphabet'

describe "Alphabet" do
  describe "AZ" do
    let(:alphabet) { Wixy::Alphabet.AZ }

    it "includes 'Z'" do
      expect(alphabet).to include('Z')
    end

    it "includes 'z'" do
      expect(alphabet).to include('z')
    end

    it "is case-insensitive for search" do
      expect(alphabet.index 'A').to eq(0)
      expect(alphabet.index 'a').to eq(0)
    end

  end
end
