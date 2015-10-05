class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    Comment.create(comment_params)
    @prototype = Prototype.find(comment_params[:prototype_id])
  end


  private
  def comment_params
    params.require(:comment).permit(:prototype_id, :comment).merge(user_id: current_user.id)
  end
end
