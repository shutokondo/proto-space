class LikesController < ApplicationController

  def create
    Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
    @likes = Like.where(prototype_id: params[:prototype_id])
    @prototype = Prototype.find(params[:prototype_id])
  end

  def update
    like = Like.find_by(user_id: current_user.id, prototype_id: params[:prototype_id])
    like.destroy
    @prototype = Prototype.find(params[:prototype_id])
    @likes = Like.where(prototype_id: params[:prototype_id])
  end
end
