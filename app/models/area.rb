class Area < ActiveRecord::Base
  has_many :area_diplomados, foreign_key: "area_id"
  validates :nombre, presence: true
  validates :estado, presence: true
  validates :picture, presence: true
end
