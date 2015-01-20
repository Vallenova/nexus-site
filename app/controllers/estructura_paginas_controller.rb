class EstructuraPaginasController < ApplicationController
  before_action :set_area_diplomados, only: [:inicio, :acerca, :diplomado]

  def inicio
  end

  def acerca
  end

  def diplomado
  	@diplomado= Diplomado.find(params[:id])
  end

  private
    def set_area_diplomados
      @area_diplomados = AreaDiplomado.where(estado: 'A').order(:id)
  	  @areas=Area.where(estado: 'A').order(:id)
    end
  
end
