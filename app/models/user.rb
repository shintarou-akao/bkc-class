class User < ApplicationRecord
  belongs_to :grade
  belongs_to :depertment
  belongs_to :subject
  
  before_save { self.email.downcase! }
  validates :nickname, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
end
