require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  ID = ENV["ID"]
  KEY = ENV["KEY"]

  def self.list_recipes(item, key = nil, id = nil)
    key ||= KEY
    id ||= ID
    url = URI.encode(BASE_URL + "app_id=#{id}" + "&app_key=#{key}" + "&q=#{item}") + "&to=100"

    data = HTTParty.get(url)

    if data["hits"]
      my_recipes = data["hits"].map do |recipe_hash|
            Recette.new(recipe_hash["recipe"])
          end
      return my_recipes
    else
      return false
    end
  end
end
