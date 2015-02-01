class Admin::DiplomadosController < ApplicationController
  layout 'admin'

  def show
  	@diplomado= Diplomado.find(params[:id])
  end

  def new
  	@diplomado=Diplomado.new
  end

  def create
  	@diplomado= Diplomado.new(diplomado_params)
  	if @diplomado.save
  	  redirect_to admin_diplomado_path(@diplomado)
  	else
  	  render 'new'
  	end
  end

  def index
    @diplomados= Diplomado.all.order(:id)
  end

  def edit
  	@diplomado= Diplomado.find(params[:id])
  end

  def update
  	@diplomado= Diplomado.find(params[:id])
  	if @diplomado.update_attributes diplomado_params
  	  redirect_to admin_diplomado_path(@diplomado)
  	else
  	  render 'edit'
  	end
  end

  private

  def diplomado_params
  	params.require(:diplomado).permit(:nombre, :estado, :descripcion, :objetivos, :dirigido, :creditos, :horas_acad, :inversion, :picture)
  end

end
