class Prototypes::PopularController < ApplicationController

  def index
    @prototypes = Prototype.order('likes_count DESC')
  end

end
