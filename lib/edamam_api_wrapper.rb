require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  ID = ENV["ID"]
  KEY = ENV["KEY"]

  def self.list_recipes(item)
    url = URI.encode(BASE_URL + "app_id=#{ID}" + "&app_key=#{KEY}" + "&q=#{item}")

    data = HTTParty.get(url)

    if data["hits"]
      my_recipes = data["hits"].each do |recipe_hash|

            Recette.new(recipe_hash["recipe"]["label"])
          end
      return my_recipes
    else
      return [false]
    end
  end
end
