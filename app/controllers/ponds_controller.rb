class PondsController < ApplicationController

  def index
    @ponds = Pond.all
  end

  def show
    @pond = Pond.find(params[:id])
  end

  def edit
    @pond = Pond.find(params[:id])
  end

  def update
    @pond = Pond.find(params[:id])
    @pond.update(pond_params)
    redirect_to pond_path(@pond)
  end

  private

  def pond_params
    params.require(:pond).permit(:name, :water_type)
  end
end
