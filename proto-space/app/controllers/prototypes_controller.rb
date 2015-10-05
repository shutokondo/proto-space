class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.order('created_at desc')
  end

  def show
    @like = Like.find_by(user_id: current_user.id, prototype_id: params[:id]) if user_signed_in?
    if @like == nil
      @like = Like.new
    else
      @like
    end
  end

  def new
    @prototype = Prototype.new
    @prototype.prototype_images.build
  end

  def create
    prototype = current_user.prototypes.new(proto_params)
    if prototype.save
      redirect_to action: :index, notice: "You have successfully created prototype."
    else
      render :new
    end
  end

  def edit
    @prototype_image = @prototype.prototype_images.build
  end

  def update
    if @prototype.update(update_params)
      @prototype.prototype_images
      redirect_to action: :index, success: "You have successfully updated prototype."
    else
      render :edit, warning: "You have unfortunately failed to create."
    end
  end

  def destroy
    @prototype.destroy
    redirect_to :root, success: "You have successfully destroyed prototype."
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def proto_params
    params.require(:prototype).permit(:title, :catchcopy, :concept, prototype_images_attributes: [:name, :property])
  end

  def update_params
    params.require(:prototype).permit(:id, :title, :catchcopy, :concept, prototype_images_attributes: [:name, :property])
  end
end
