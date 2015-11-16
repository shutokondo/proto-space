class Prototypes::PopularController < ApplicationController

  def index
    @prototypes = Prototype.order(likes_count: :desc).page(params[:page]).per(8).eager_load(:user)
  end

end
