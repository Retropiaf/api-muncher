class UsersController < ApplicationController

  before_action :find_user

  def favorite
    if @user.favorites.include? params["uri"]
      @user.favorites.delete(params["uri"])
      if @user.save
        flash[:status] = :success
        flash[:message] = "#{params["uri"]} was deleted from your favorites"
      else
        lash[:status] = :failure
        flash[:message] = "#{params["uri"]} couldn't be deleted from your favorites"
      end
    else
      @user.favorites << params["uri"]
      if @user.save
        flash[:status] = :success
        flash[:message] = "#{params["uri"]} was added to your favorites"
      else
        lash[:status] = :failure
        flash[:message] = "#{params["uri"]} couldn't be added to your favorites"
      end
    end
    redirect_back fallback_location: root_path
  end

  def favorites
    @user.favorites.each do |recipe_uri|

    end
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