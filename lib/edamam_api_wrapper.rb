require 'httparty'

class SlackApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  ID = ENV["ID"]
  KEY = ENV["KEY"]

  def self.list_recipes(search_term)
    url = URI.encode(BASE_URL + "app_id=#{ID}" + "app_key=#{KEY}" + "q=#{search_term}")

    data = HTTParty.get(url)

    if data["hits"]
      my_recipes = data["recipes"].map do |recipe_hash|
        Recipe.new(recipe_hash["title"])
      end
      return my_recipes
    else
      return []
    end
  end
end
