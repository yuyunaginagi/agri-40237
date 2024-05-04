class Subject < ApplicationRecord
  has_many :subject_users
  has_many :users, through: :subject_users
  has_many :teaching_materials
  has_many :tests
  has_many :questions
  has_one_attached :image
end
