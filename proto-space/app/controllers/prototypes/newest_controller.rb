class Prototypes::NewestController < ApplicationController

  def index
    @prototypes = Prototype.eager_load(:user).order(created_at: :desc).page(params[:page]).per(8)
  end
  
end
