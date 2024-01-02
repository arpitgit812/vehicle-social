class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  has_many :likes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         has_many :active_follows, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy
  has_many :following, through: :active_follows, source: :followed

  has_many :passive_follows, class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy
  has_many :followers, through: :passive_follows, source: :follower
  has_many :shares, dependent: :destroy

  def following?(other_user)
    following.include?(other_user)
  end
  
  def likes?(post)
    likes.exists?(post_id: post.id)
  end

  def follow(other_user)
    active_follows.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_follows.find_by(followed_id: other_user.id).destroy
  end

    # def following?(other_user)
    #   followed_users.include?(other_user)
    # end
      
end
