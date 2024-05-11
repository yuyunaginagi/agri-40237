class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :subject_users
  has_many :subjects, through: :subject_users
  has_many :teaching_materials
  has_many :exams
  has_many :questions
end
