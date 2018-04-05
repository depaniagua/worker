class ConcursosController < ApplicationController
  before_action :authenticate_user!, except:[:show] 
  
  def index
    #@concursos = Concurso.all
    #@concursos = current_user.concursos.all
    @concursos = current_user.concursos.order('created_at desc').paginate(page:params[:page],per_page:5)
  end

  def show
    #@concurso = Concurso.find(params[:id])
    unless current_user && 
      @concurso = Concurso.order('created_at desc').paginate(page:params[:page],per_page:5).find(params[:id])
    else
      @concurso = current_user.concursos.order('created_at desc').paginate(page:params[:page],per_page:5).find(params[:id])
    end
  end

  def new
    #@concurso = Concurso.new
    @concurso = current_user.concursos.new
  end

  def edit
    #@concurso = Concurso.find(params[:id])
    @concurso = current_user.concursos.find(params[:id])
  end

  def create
    #render plain: params[:evento].inspect - To check on the received parameters
    #concurso = Concurso.new(concurso_params)
    @concurso = current_user.concursos.new(concurso_params)

    if @concurso.save
      redirect_to @concurso
    else
      render 'new'
    end
  end

  def update
    #@concurso = Concurso.find(params[:id])
    @concurso = current_user.concursos.find(params[:id])

    if @concurso.update(concurso_params)
      redirect_to @concurso
    else
      render 'edit'
    end
  end

  def destroy
    #@concurso = Concurso.find(params[:id])
    @concurso = current_user.concursos.find(params[:id])
    @concurso.destroy
    redirect_to concursos_path
  end

  private
  def concurso_params
    params.require(:concurso).permit(:nombre, :image, :url, :fechainicio, :fechafin, :valorpagar, :texto, :recomendaciones)
  end

end
