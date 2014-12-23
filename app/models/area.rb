class Area < ActiveRecord::Base
  mount_uploader :picture, PictureUploader

  validates :nombre, presence: true
  validates :estado, presence: true
  validates :picture, presence: true
end
