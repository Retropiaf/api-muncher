class Recette
  attr_reader :title

  def initialize(hash)
    raise ArgumentError if hash[:label] == nil || hash[:label] == ""
    @title = hash[:label]
  end
end
