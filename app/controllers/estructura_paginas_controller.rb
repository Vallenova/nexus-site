class EstructuraPaginasController < ApplicationController
  
  def inicio
  	@areas=Area.where(estado: 'A').order(:id)
  end

  def acerca
  	@areas=Area.where(estado: 'A').order(:id)
  end

  
end
