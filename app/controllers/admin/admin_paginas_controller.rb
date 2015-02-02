class Admin::AdminPaginasController < ApplicationController
  before_filter :authenticate_usuario!
  layout 'admin'

  def index
  end
end
