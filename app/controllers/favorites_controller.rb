class FavoritesController < ApplicationController
  def create
    @user = current_user
    @apppost = Apppost.find(params[:apppost_id])
    if Favorite.create(user_id: @user.id,apppost_id:@apppost.id)
      redirect_to @apppost
    else
      redirect_to root_url
    end
  end

  def destroy
    @user = current_user
    @apppost = Apppost.find(params[:apppost_id])
    if favorite  = Favorite.find_by(user_id: @user.id,apppost_id: @apppost.id)
      favorite.delete
      redirect_to @apppost
    else
      redirect_to root_url
    end
  end
end
