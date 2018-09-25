class FrogsController < ApplicationController

  def new
    @frog = Frog.new
  end

  def create
    @frog = Frog.create(frog_params)
    redirect_to frog_path(@frog)
  end

  def show
    @frog = Frog.find(params[:id])
  end

  def index
    @frogs = Frog.all
  end

  def edit
    @frog = Frog.find(params[:id])
  end



  private

  def frog_params
    params.require(:frog).permit(:name, :color, :pond_id)
  end
end
