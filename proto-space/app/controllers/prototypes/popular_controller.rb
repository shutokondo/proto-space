class Prototypes::PopularController < ApplicationController

  def index
    @prototypes = Prototype.order('likes_count DESC').page(params[:page]).per(8).includes(:user).eager_load(:prototype_images)
  end

end
