class Subject < ApplicationRecord
  has_many :subject_users, dependent: :destroy
  has_many :users, through: :subject_users
  has_many :teaching_materials, dependent: :destroy
  has_many :exams, dependent: :destroy
  # has_many :questions, dependent: :destroy
  has_one_attached :image

  validates :subject_name, presence: true
  validates :image, presence: true
end
