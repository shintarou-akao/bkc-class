class Post < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  belongs_to :teacher
  
  validates :lesson_evaluation, presence: true
  validates :lesson_level, presence: true
  validates :text_necessity, presence: true
  validates :attendance, presence: true
  validates :additional_explanation, length: { maximum: 300 }
end
