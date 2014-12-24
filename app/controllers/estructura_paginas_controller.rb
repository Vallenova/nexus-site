class EstructuraPaginasController < ApplicationController

  def inicio
  	@areas=Area.all.order('id')
  end

  def acerca
  end
end
