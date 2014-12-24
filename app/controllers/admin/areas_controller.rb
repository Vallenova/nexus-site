class Admin::AreasController < ApplicationController
  layout 'admin'

  def show
  	@area =Area.find(params[:id])
  end

  def new
  	@area = Area.new
  end

  def create
  	@area = Area.new(area_params)
  	if @area.save
  		redirect_to admin_area_path(@area)
  	else
  		render 'new'
  	end
  end

  def index
  	@areas = Area.all.order('id')
  end

  def edit
  	@area =Area.find(params[:id])
  end

  def update
	@area = Area.find params[:id]
	  if @area.update_attributes area_params
		redirect_to admin_area_path(@area)
	  else
		render 'edit'
	  end
  end



  def area_params
  	params.require(:area).permit(:nombre,:estado,:picture)
  end

end
