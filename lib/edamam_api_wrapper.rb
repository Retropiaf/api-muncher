require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  ID = ENV["ID"]
  KEY = ENV["KEY"]

  def self.list_recipes(item)
    url = URI.encode(BASE_URL + "app_id=#{ID}" + "&app_key=#{KEY}" + "&q=#{item}") + "&to=30000"

    data = HTTParty.get(url)

    if data["hits"]
      my_recipes = data["hits"].map do |recipe_hash|
            Recette.new(label: recipe_hash["recipe"]["label"])
          end
      return my_recipes
    else
      return [false]
    end
  end
end
