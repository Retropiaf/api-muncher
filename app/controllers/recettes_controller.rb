class RecettesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.list_recipes(params["item"]).paginate(:page => params[:page], per_page: 9)
    render :index
  end

  def show
  end
end
