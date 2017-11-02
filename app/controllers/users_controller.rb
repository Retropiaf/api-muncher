class UsersController < ApplicationController

  before_action :find_user

  def favorite
    # found = false
    # @user.favorites.each do |recipe|
    #   if recipe.title == recipe.title
    #     found = true
    #     @user.favorites.delete(recipe)
    #     if @user.save
    #       flash[:status] = :success
    #       flash[:message] = "#{recipe.title} was deleted from your favorites"
    #     else
    #       lash[:status] = :failure
    #       flash[:message] = "#{recipe.title} couldn't be deleted from your favorites"
    #     end
    #   end
    # end
    # if found == false
    #   @user.favorites << @recipe
    #   if @user.save
    #     flash[:status] = :success
    #     flash[:message] = "#{recipe.title} was added to your favorites"
    #   else
    #     lash[:status] = :failure
    #     flash[:message] = "#{recipe.title} couldn't be added to your favorites"
    #   end
    # end

    if @user.favorites.include? params["title"]
      @user.favorites.delete(params["title"])
      if @user.save
        flash[:status] = :success
        flash[:message] = "#{params["title"]} was deleted from your favorites"
      else
        lash[:status] = :failure
        flash[:message] = "#{params["title"]} couldn't be deleted from your favorites"
      end
    else
      @user.favorites << params["title"]
      if @user.save
        flash[:status] = :success
        flash[:message] = "#{params["title"]} was added to your favorites"
      else
        lash[:status] = :failure
        flash[:message] = "#{params["title"]} couldn't be added to your favorites"
      end
    end
    redirect_back fallback_location: root_path
  end

  def favorites
    @favorites = []
    @user.favorites.each do |recipe_title|
      @favorites << recipe_title
    end
    return @favorites
  end

  private

  def find_user
    @user = User.find_by(id: session[:user_id])
    unless @user
      flash[:status] = :failure
      flash[:message] = "Invalid request"
      return redirect_back fallback_location: root_path
    end
  end
end
