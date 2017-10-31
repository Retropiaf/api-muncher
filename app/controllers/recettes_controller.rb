class RecettesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.list_recipes(params["item"])
    render :index
  end

  def show
  end
end
