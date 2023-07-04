class FavoritesController < ApplicationController
  def create
    Favorite.create(favorite_params)
    @post = Post.find(params[:post_id])

    render turbo_stream: turbo_stream.replace(
      "favorite_post_#{@post.id}",
      partial: "posts/bookmark_link",
      locals: {post: @post}
    )

  end

  def destroy
    if favorite = Favorite.find_by(favorite_params)
      favorite.destroy
    end
    @post = Post.find(params[:post_id])

    render turbo_stream: turbo_stream.replace(
      "favorite_post_#{@post.id}",
      partial: "posts/bookmark_link",
      locals: {post: @post}
    )

  end

  private
  def favorite_params
    { post_id: params[:post_id], user_id: current_user.id}
  end
end
