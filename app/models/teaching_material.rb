class TeachingMaterial < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  has_one_attached :file
  
  validates :title, presence: true
  validates :file, presence: true
end
