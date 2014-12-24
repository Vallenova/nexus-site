class Area < ActiveRecord::Base
  validates :nombre, presence: true
  validates :estado, presence: true
  validates :picture, presence: true
end
