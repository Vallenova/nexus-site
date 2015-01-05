class Modulo < ActiveRecord::Base
  belongs_to :diplomado
  validates :diplomado_id, presence: true
  validates :nombre, presence: true
  validates :estado, presence: true
end
