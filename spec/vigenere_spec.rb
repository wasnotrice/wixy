require 'vigenere'
require 'yaml'

module ExampleHelpers
  def filename_for(group)
    "vigenere_examples_#{group}.yaml"
  end

  def load_examples(group)
    examples = YAML.load(File.read(File.join(File.dirname(__FILE__), filename_for(group))))
  end
end

describe "Vigenere" do
  extend ExampleHelpers

  describe "basic" do
    load_examples("basic_encryption").each do |example|
      let(:vigenere) { Vigenere.new(example["key"]) }
      it "encrypts '#{example['cleartext']}' to '#{example['ciphertext']}'" do
        expect(vigenere.encrypt example["cleartext"]).to eq(example["ciphertext"])
      end
    end
  end
end
