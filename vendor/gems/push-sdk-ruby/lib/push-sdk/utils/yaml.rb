require 'yaml'
require 'erb'

module YAML
  class << self

    def load_default(path)
      YAML.load(ERB.new(IO.read(path)).result)
    end

    def load_symbol(path)
      YAML.load(ERB.new(IO.read(path)).result).deep_symbolize_keys
    end

    def load_ostruct(path)
      YAML.load(ERB.new(IO.read(path)).result).to_ostruct
    end
  end
end
