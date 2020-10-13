class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @prototypes = User.all
  end

  def new
    @prototypes = User.new
  end

  def create
    User.create(prototype_params)
  end

  def destroy
    prototype = User.find(params[:id])
    prototype.destroy
  end

  def edit
  end

  def update
    prototype = User.find(params[:id])
    prototype.update(prototype_params)
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile, :occupation, :position).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = User.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
