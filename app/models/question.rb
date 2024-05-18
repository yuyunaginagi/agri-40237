class Question < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  
  validates :title, presence: true
  validates :question, presence: true
end
