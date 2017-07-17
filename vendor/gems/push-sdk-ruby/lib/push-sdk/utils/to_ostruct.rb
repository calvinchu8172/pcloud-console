require 'ostruct'

class Hash
  def to_ostruct
    each do |k, v|
      self[k] = v.respond_to?(:to_ostruct) ? v.to_ostruct : v
    end
    OpenStruct.new(self)
  end
end

class Array
  def to_ostruct
    map do |v|
      v.respond_to?(:to_ostruct) ? v.to_ostruct : v
    end
  end
end
