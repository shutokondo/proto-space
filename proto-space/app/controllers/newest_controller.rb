class NewestController < ApplicationController

  def index
    @prototypes = Prototype.order('created_at desc')
  end
  
end
