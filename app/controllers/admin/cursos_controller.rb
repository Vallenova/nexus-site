class Admin::CursosController < ApplicationController
  before_filter :authenticate_usuario!
  layout 'admin'

  def index
  	@cursos = Curso.all.order(:id)
  end

  def show
  	@curso = Curso.find(params[:id])
  end

  def new
    @diplomados=Diplomado.where(estado: 'A').order(:id)
  	@curso=Curso.new
  end

  def create
  	@curso= Curso.new(curso_params)
  	if @curso.save
  	  redirect_to admin_curso_path(@curso)
  	else
      @diplomados=Diplomado.where(estado: 'A').order(:id)
  	  render 'new'
  	end
  end

  def edit
    @diplomados=Diplomado.where(estado: 'A').order(:id)
  	@curso = Curso.find(params[:id])
  end

  def update
  	@curso = Curso.find(params[:id])
  	if @curso.update_attributes curso_params
  	  redirect_to admin_curso_path(@curso)
  	else
      @diplomados=Diplomado.where(estado: 'A').order(:id)
  	  render 'edit'
  	end
  end

private

  def curso_params
  	params.require(:curso).permit(:nombre, :estado, :modulo_id)
  end
end
