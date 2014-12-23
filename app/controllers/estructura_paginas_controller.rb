class EstructuraPaginasController < ApplicationController

  def inicio
  	@areas=Area.all
  end

  def acerca
  end
end
