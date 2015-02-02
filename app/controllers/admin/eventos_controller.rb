class Admin::EventosController < ApplicationController
  layout 'admin'

  def index
  	@eventos = Evento.all.order(:fecha_inicio)
  end

  def show
  	@evento = Evento.find(params[:id])
  end

  def new
  	@diplomados=Diplomado.where(estado: 'A').order(:id)
  	@evento=Evento.new
  end

  def create
  	@evento= Evento.new(evento_params)
  	if @evento.save
  	  redirect_to admin_evento_path(@evento)
  	else
  	  @diplomados=Diplomado.where(estado: 'A').order(:id)
  	  render 'new'
  	end
  end

  def edit
  	@diplomados=Diplomado.where(estado: 'A').order(:id)
  	@evento = Evento.find(params[:id])
  end

  def update
  	@evento = Evento.find(params[:id])
  	if @evento.update_attributes evento_params
  	  redirect_to admin_evento_path(@evento)
  	else
  	  @diplomados=Diplomado.where(estado: 'A').order(:id)
  	  render 'edit'
  	end
  end

private

  def evento_params
  	params.require(:evento).permit(:fecha_inicio, :fecha_fin, :modalidad, :inversion, :estado, :diplomado_id)
  end
end
