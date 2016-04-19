class User < ActiveRecord::Base

  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable,
         :timeoutable

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates_uniqueness_of :email, on: :create
  validates_confirmation_of :password
  validates :username, presence: true, length: { minimum: 3 }

  has_many :comments

  def admin?
    self.admin
  end

  def has_collected_video?(id)
    video_ids.include?(id)
  end

  def has_collected_article?(id)
    article_ids.include?(id)
  end

  def has_commented_video?(video)
    comments.any?{ |comment| comment.commentable == video }
  end

  def has_commented_article?(article)
    comments.any?{ |comment| comment.commentable == article }
  end

end
