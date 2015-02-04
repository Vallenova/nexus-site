class Admin::ColeccionsController < ApplicationController
  before_filter :authenticate_usuario!
  layout 'admin'

  def index
  	@coleccions = Coleccion.all.order('id')
  end

  def show
  	@coleccion =Coleccion.find(params[:id])
  end

  def new
  	@coleccion = Coleccion.new
  end

  def create
  	@coleccion = Coleccion.new(coleccion_params)
  	if @coleccion.save
  		redirect_to admin_coleccion_path(@coleccion)
  	else
  		render 'new'
  	end
  end

  def edit
  	@coleccion =Coleccion.find(params[:id])
  end

  def update
	@coleccion = Coleccion.find params[:id]
	  if @coleccion.update_attributes coleccion_params
			redirect_to admin_coleccion_path(@coleccion)
	  else
			render 'edit'
	  end
  end

private

  def coleccion_params
  	params.require(:coleccion).permit(:descripcion,:url,:estado,:picture)
  end

end
