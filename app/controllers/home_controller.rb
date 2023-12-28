class HomeController < ApplicationController
  def top
    @q = Post.ransack(params[:q])
    @agents = Agent.all
    @maps = Map.all
  end

  def policy
  end
end
