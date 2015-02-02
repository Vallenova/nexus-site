class Evento < ActiveRecord::Base
  belongs_to :diplomado
  validates :fecha_inicio, presence: true
  validates :fecha_fin, presence: true
  validates :modalidad, presence: true
  validates :inversion, presence: true
  validates :estado, presence: true
end	
