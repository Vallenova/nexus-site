class EstructuraPaginasController < ApplicationController
  
  def inicio
  	@area_diplomados = AreaDiplomado.where(estado: 'A').order(:id)
  	@areas=Area.where(estado: 'A').order(:id)
  end

  def acerca
  	@area_diplomados = AreaDiplomado.where(estado: 'A').order(:id)
  	@areas=Area.where(estado: 'A').order(:id)
  end

  
end
