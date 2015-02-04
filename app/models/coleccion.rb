class Coleccion < ActiveRecord::Base
  validates :descripcion, presence: true
  validates :estado, presence: true
  validates :url, presence: true
  validates :picture, presence: true
end
