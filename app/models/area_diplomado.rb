class AreaDiplomado < ActiveRecord::Base
  belongs_to :area
  belongs_to :diplomado

  validates :area_id, presence: true
  validates :diplomado_id, presence: true
  validates :estado, presence: true

  validates_uniqueness_of :area_id, :scope => :diplomado_id
end
