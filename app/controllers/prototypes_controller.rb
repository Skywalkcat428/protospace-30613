class PrototypesController < ApplicationController
  def index
    @prototyoes = Prototyoe.all
  end

  def new
    @prototyoes = Prototyoe.new
  end

end
