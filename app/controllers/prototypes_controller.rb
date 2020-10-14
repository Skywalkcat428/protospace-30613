class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototypes = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params)

    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def destroy
  #   prototype = Prototype.find(params[:id])
  #   prototype.destroy
  # end

  # def edit
  # end

  # def update
  #   prototype = Prototype.find(params[:id])
  #   prototype.update(prototype_params)
  # end

  # def show
  # end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept,).merge(user_id: current_user.id)
  end

  # def set_prototype
  #   @prototype = Prototype.find(params[:id])
  # end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
