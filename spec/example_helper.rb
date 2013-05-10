require 'yaml'

module ExampleHelpers
  def filename_for(cipher, mode, group=nil)
    _group = group ? "_#{group}" : ""
    "#{cipher}_examples_#{mode}#{_group}.yaml"
  end

  def load_examples(cipher, mode, group)
    filename = filename_for(cipher, mode, group)
    path = File.join(File.dirname(__FILE__), filename)
    examples = YAML.load(File.read(path)) || []
  end
end
