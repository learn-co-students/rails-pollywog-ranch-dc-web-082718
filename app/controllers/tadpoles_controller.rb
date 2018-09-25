class TadpolesController < ApplicationController

  def show

    @tadpole = Tadpole.find(params[:id])
  end

  def index
    @tadpoles = Tadpole.all
  end

  def new

    if params[:frog_id] && !Frog.exists?(id: params[:frog_id])
      redirect_to frogs_path, alert: "Frog not found."
    else
      @frog = Frog.find(params[:frog_id])
      @tadpole = Tadpole.new(frog_id: params[:frog_id])
    end
  end

  def create

    @tadpole = Tadpole.create(tadpole_params)
    redirect_to tadpole_path(@tadpole)
  end

  def edit
    @tadpole = Tadpole.find(params[:id])
    @frog = @tadpole.frog
  end

  def update
    @tadpole = Tadpole.find(params[:id])
    @tadpole.update(tadpole_params)
    redirect_to tadpole_path(@tadpole)
  end




  def metamorphose
    tadpole = Tadpole.find(params[:id])
    frog = Frog.create(name: tadpole.name, color: tadpole.color, pond: tadpole.pond)
    tadpole.destroy
    redirect_to frog_path(frog)
  end

  def destroy
    @tadpole = Tadpole.find(params[:id])
    @tadpole.destroy
    redirect_to tadpoles_path
  end

  private

  def tadpole_params
    params.require(:tadpole).permit(:name, :color, :frog_id)
  end

end
