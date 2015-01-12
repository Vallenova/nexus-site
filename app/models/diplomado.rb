class Diplomado < ActiveRecord::Base
  has_many :modulos
  has_many :area_diplomados, foreign_key: "diplomado_id"
  validates :nombre, presence: true
  validates :estado, presence: true
  validates :descripcion, presence: true
  validates :objetivos, presence: true
  validates :dirigido, presence: true
  validates :creditos, presence: true
  validates :horas_acad, presence: true
  validates :inversion, presence: true
  validates :picture, presence: true
end
