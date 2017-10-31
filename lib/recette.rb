class Recette
  attr_reader :title, :image
  NO_IMAGE = "https://i5.walmartimages.com/asr/f752abb3-1b49-4f99-b68a-7c4d77b45b40_1.39d6c524f6033c7c58bd073db1b99786.jpeg?odnHeight=450&odnWidth=450&odnBg=FFFFFF"

  def initialize(hash)
    raise ArgumentError if hash["label"] == nil || hash["label"] == ""
    @title = hash["label"]
    if hash["image"] == nil
      @image = NO_IMAGE
    else
      @image = hash["image"]
    end
  end
end
