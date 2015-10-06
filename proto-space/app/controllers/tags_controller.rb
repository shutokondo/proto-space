class TagsController < ApplicationController

  def index
    @tags = ActsAsTaggableOn::Tag.most_used(10)
  end

  def show
    @prototypes = Prototype.tagged_with(params[:id])
  end

end