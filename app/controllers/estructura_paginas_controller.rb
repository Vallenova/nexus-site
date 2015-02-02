class EstructuraPaginasController < ApplicationController
  before_action :set_area_diplomados, only: [:inicio, :acerca, :diplomado, :calendario, :evento]

  def inicio
  end

  def acerca
  end

  def diplomado
  	@diplomado= Diplomado.find(params[:id])
  end

  def calendario
    @eventos= Evento.where(estado: 'A').order(:fecha_inicio).paginate(page: params[:page], :per_page => 8)
  end

  def evento
    @evento= Evento.find(params[:id])
  end

  private
    def set_area_diplomados
      @area_diplomados = AreaDiplomado.where(estado: 'A').order(:id)
  	  @areas=Area.where(estado: 'A').order(:id)
    end
  
end
