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

  def has_collected?(resource)
    if resource.instance_of?(Video)
      video_ids.include?(resource.id)
    else
      article_ids.include?(resource.id)
    end
  end

  def has_commented?(resource)
    comments.any?{ |comment| comment.commentable == resource }
  end

end
