class Recipe
  attr_reader :title

  def initialize(hash)
    raise ArgumentError if title == nil || name == ""
    @title = hash[:label]
  end
end
