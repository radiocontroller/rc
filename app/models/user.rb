class User < ActiveRecord::Base

  mount_uploader :avatar, AvatarUploader

  has_many :comments

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

  after_save :activate


  def activate
    self.send_confirmation_instructions if Rails.env == 'production'
  end

  def admin?
    admin
  end

  def deleted?
    deleted
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

  def role
    admin? ? '管理员' : '用户'
  end

  def role_operation
    admin? ? '解除管理员' : '设为管理员'
  end

  def state
    deleted? ? '禁用' : '正常'
  end

  def toggle!
    update(admin: !self.admin)
  end

end
