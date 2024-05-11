class Exam < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  has_many_attached :files
  
  validates :title, presence: true
  validates :files, presence: true
end
