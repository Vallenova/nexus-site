class Admin::AreaDiplomadosController < ApplicationController
  layout 'admin'

  def index
  	@area_diplomados = AreaDiplomado.all.order(:id)
  end
end
