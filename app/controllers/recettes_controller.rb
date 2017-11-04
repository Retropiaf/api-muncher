class RecettesController < ApplicationController
  def index
    diet_labels = [params["balanced"], params["high-fiber"], params["high-protein"]]


    non_paginated_recipes = EdamamApiWrapper.list_recipes(params["item"],diet_labels)

    if session[:user_id] && params["item"].present?
      user = User.find_by_id(session[:user_id])
      user.recent_search << params["item"] unless user.recent_search.include? params["item"]
      user.save
    end


    non_paginated_recipes == [] if non_paginated_recipes == false

    @recipes = non_paginated_recipes.paginate(:page => params[:page], per_page: 9)

    render :index
  end

  def show
    # TODO: Check if I can just call non-paginated-recipes
      # @recipes = EdamamApiWrapper.list_recipes(params[:item])
      # @recipe = nil
      # @recipes.each do |recipe_object|
      #   if recipe_object.title == params[:id]
      #     return @recipe = recipe_object
      #   end
      # end



    @recipe = EdamamApiWrapper.find_recipe(params["uri"])
    if @recipe == false
      flash[:status] = :failure
      flash[:message] = "Could not find recipe"
      return redirect_back(fallback_location: root_path)
    end
  end
end
