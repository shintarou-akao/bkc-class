class User < ApplicationRecord
  belongs_to :grade
  belongs_to :department
  belongs_to :subject
  
  before_save { self.email.downcase! }
  validates :department, presence: true
  validates :subject, presence: true
  validates :nickname, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :posts, dependent: :destroy
  
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  has_many :followers, through: :reverses_of_relationship, source: :user
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  
  has_many :comments, dependent: :destroy
  
  has_many :messages, dependent: :destroy
  has_many :sent_messages, through: :messages, source: :receive_user 
  has_many :reverses_of_message, class_name: 'Message', foreign_key: 'receive_user_id', dependent: :destroy
  has_many :received_messages, through: :reverses_of_message, source: :user
  
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end
  
  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end
  
  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  def feed_posts
    Post.where(user_id: self.following_ids + [self.id])
  end
  
  def favorite(post)
    self.favorites.find_or_create_by(post_id: post.id)
  end
  
  def unfavorite(post)
    favorite = self.favorites.find_by(post_id: post.id)
    favorite.destroy if favorite
  end
  
  def favorite?(post)
    self.favorite_posts.include?(post)
  end
  
  def message
    unless self == other_user
      self.messages.create(receive_user_id: other_user.id)
    end
  end
end
