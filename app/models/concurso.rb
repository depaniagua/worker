class Concurso < ApplicationRecord
  belongs_to :user
  has_many :voces
  mount_uploader :image, ImageUploader
end
