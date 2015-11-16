class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.includes(:user).order('created_at desc').page(params[:page]).per(8)
  end

  def show
    @like = Like.find_by(user_id: current_user.id, prototype_id: params[:id]) if user_signed_in?
    @comment = Comment.new
    @comments = @prototype.comments
  end

  def new
    @prototype = Prototype.new
    @prototype.prototype_images.build
  end

  def create
    @prototype = current_user.prototypes.new(proto_params)
    if @prototype.save
      redirect_to action: :index, flash: { notice: "You have successfully created prototype." }
    else
      @prototype.prototype_images.build
      render :new, flash: { warning: "You have unfortunately failed to create." }
    end
  end

  def edit
    redirect_to root_path, flash: { danger: "Access denied." } unless @prototype.user_id == current_user.id
  end

  def update
    binding.pry
    if @prototype.update(update_params)
      @prototype.prototype_images
      redirect_to action: :index, flash: { success: "You have successfully updated prototype." }
    else
      render :edit, flash: { warning: "You have unfortunately failed to update." }
    end
  end

  def destroy
    @prototype.destroy
    redirect_to :root, flash: { success: "You have successfully destroyed prototype." }
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def proto_params
    params.require(:prototype).permit(:title, :catchcopy, :concept, tag_list: [], prototype_images_attributes: [:name, :property])
  end

  def update_params
    params.require(:prototype).permit(:id, :title, :catchcopy, :concept, tag_list: [], prototype_images_attributes: [:name, :property, :id])
  end
end
