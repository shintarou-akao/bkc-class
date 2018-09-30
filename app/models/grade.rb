class Grade < ApplicationRecord
  validates :grade, presence: true, numericality: true
end
