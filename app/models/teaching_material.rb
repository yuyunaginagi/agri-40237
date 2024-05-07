class TeachingMaterial < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  
  validates :title, presence: true
  validates :file, presence: true
end
