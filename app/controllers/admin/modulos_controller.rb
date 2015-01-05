class Admin::ModulosController < ApplicationController
  layout 'admin'

  def index
  	@modulos = Modulo.all.order(:id)
  end

  def show
  	@modulo = Modulo.find(params[:id])
  end

  def new
  	@diplomados=Diplomado.where(estado: 'A').order(:id)
  	@modulo=Modulo.new
  end

  def create
  	@modulo= Modulo.new(modulo_params)
  	if @modulo.save
  	  redirect_to admin_modulo_path(@modulo)
  	else
  	  @diplomados=Diplomado.where(estado: 'A').order(:id)
  	  render 'new'
  	end
  end

  def edit
  	@diplomados=Diplomado.where(estado: 'A').order(:id)
  	@modulo = Modulo.find(params[:id])
  end

  def update
  	@modulo = Modulo.find(params[:id])
  	if @modulo.update_attributes modulo_params
  	  redirect_to admin_modulo_path(@modulo)
  	else
  	  @diplomados=Diplomado.where(estado: 'A').order(:id)
  	  render 'edit'
  	end
  end

private

  def modulo_params
  	params.require(:modulo).permit(:nombre, :estado, :diplomado_id)
  end

end
