class UsersController < ApplicationController

  before_action :find_user

  def favorites
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
