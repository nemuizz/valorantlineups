class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).includes(:map, :agent, :favorites).with_attached_hit.with_attached_position.with_attached_angle
  end

  def favorites
    @user = User.find(params[:id])
    
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @posts = Post.find(favorites)
  end
end
