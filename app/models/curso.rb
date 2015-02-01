class Curso < ActiveRecord::Base
  belongs_to :modulo
  validates :modulo_id, presence: true
  validates :nombre, presence: true
  validates :estado, presence:true
end
