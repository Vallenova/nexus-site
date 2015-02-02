class Admin::AreaDiplomadosController < ApplicationController
  before_filter :authenticate_usuario!
  layout 'admin'

  def index
  	@area_diplomados = AreaDiplomado.all.order(:id)
  end

  def show
  	@area_diplomado = AreaDiplomado.find(params[:id])
  end

  def new
  	@areas=Area.where(estado: 'A').order(:id)
    @diplomados=Diplomado.where(estado: 'A').order(:id)
  	@area_diplomado=AreaDiplomado.new
  end

  def create
  	@area_diplomado= AreaDiplomado.new(area_diplomado_params)
  	if @area_diplomado.save
  	  redirect_to admin_area_diplomado_path(@area_diplomado)
  	else
      @areas=Area.where(estado: 'A').order(:id)
      @diplomados=Diplomado.where(estado: 'A').order(:id)
  	  render 'new'
  	end
  end

  def edit
    @areas=Area.where(estado: 'A').order(:id)
    @diplomados=Diplomado.where(estado: 'A').order(:id)
  	@area_diplomado = AreaDiplomado.find(params[:id])
  end

  def update
  	@area_diplomado = AreaDiplomado.find(params[:id])
  	if @area_diplomado.update_attributes area_diplomado_params
  	  redirect_to admin_area_diplomado_path(@area_diplomado)
  	else
      @areas=Area.where(estado: 'A').order(:id)
      @diplomados=Diplomado.where(estado: 'A').order(:id)
  	  render 'edit'
  	end
  end

private

  def area_diplomado_params
  	params.require(:area_diplomado).permit(:area_id, :diplomado_id, :estado)
  end

end
