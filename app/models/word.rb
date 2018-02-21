class Word
  attr_reader :root
  def initialize(attributes={})
    @root = attributes[:root]
  end
end 