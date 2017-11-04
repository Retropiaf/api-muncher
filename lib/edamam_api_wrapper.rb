require 'httparty'

# TODO: USE .present? instead of checking if not nil and not empty

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

  # def self.find_recipe(item, recip_id, key = nil, id = nil)
  #   key ||= KEY
  #   id ||= ID
  #   url = URI.encode(BASE_URL + "app_id=#{id}" + "&app_key=#{key}" + "&q=#{item}") + "&to=100"
  #
  #   data = HTTParty.get(url)
  #
  #   if data["hits"]
  #     my_recipes = data["hits"].map do |recipe_hash|
  #       Recette.new(recipe_hash["recipe"])
  #     end
  #
  #     my_recipes.each do |recipe_object|
  #       if recipe_object.title == recip_id
  #         return recipe_object
  #       end
  #     end
  #   end
  #   return false
  # end

  def self.find_recipe(uri, key = nil, id = nil)
    key ||= KEY
    id ||= ID
    url = URI.encode(BASE_URL + "app_id=#{id}" + "&app_key=#{key}" + "&r=#{uri}")

    data = HTTParty.get(url)

    if data.present?
      Recette.new(data[0])
    else
      return false
    end
  end
end
