class Modulo < ActiveRecord::Base
  belongs_to :diplomado
  has_many :cursos
  has_many :eventos
  validates :diplomado_id, presence: true
  validates :nombre, presence: true
  validates :estado, presence: true
end
