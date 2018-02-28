class Word
  attr_reader :root, :original
  def initialize(attributes={})
    @root = attributes[:root]
    @original = attributes[:original]
  end
  
  def valid?
    @root.present?
  end
end 