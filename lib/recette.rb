class Recette
  attr_reader :title

  def initialize(label)
    raise ArgumentError if label == nil || label == ""
    @title = label
  end
end
