class AddRecipesArrayToFavorite < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :api_recipes, :string, array: true, default: []
  end
end
