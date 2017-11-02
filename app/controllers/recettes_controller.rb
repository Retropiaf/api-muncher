class RecettesController < ApplicationController
  def index
    non_paginated_recipes = EdamamApiWrapper.list_recipes(params["item"])

    unless non_paginated_recipes == false
      non_paginated_recipes == []
    end

    @recipes = non_paginated_recipes.paginate(:page => params[:page], per_page: 9)
    render :index
  end

  def show
    # TODO: Check if I can just call non-paginated-recipes
      @recipes = EdamamApiWrapper.list_recipes(params[:item])
      @recipe = nil
      @recipes.each do |recipe_object|
        if recipe_object.title == params[:id]
          return @recipe = recipe_object
        end
      end

    # end
  end
end
