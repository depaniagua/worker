class VocesController < ApplicationController
  def create
    @concurso = Concurso.find(params[:concurso_id])
    @voces = @concurso.voces.create(voces_params)
    redirect_to concurso_path(@concurso)
  end

  def new
    @concurso = Concurso.find(params[:concurso_id])
    @voces = @concurso.voces.new    
  end

  private
  def voces_params
    params.require(:voce).permit(:email, :nombres, :apellidos, :fechacarga, :observaciones, :estadovoz, :archivooriginal, :archivoconvertido)
  end
end
