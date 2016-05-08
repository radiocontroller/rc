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

  def admin?
    admin
  end

  def deleted?
    deleted
  end

  def confirmed?
    confirmed_at.present?
  end

  def limit?
    free_at > Time.now
  end

  def release?
    free_at < Time.now
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

  def toggle!
    update(admin: !self.admin)
  end

  def release!
    update(free_at: Time.now)
  end

  def limit!(days)
    update(free_at: Time.now + days.to_i.days)
  end

  def replies
    comment_ids = self.comments.where(parent_id: nil).ids
    return nil if comment_ids.empty?
    Comment.normal.find_by_sql("select * from comments where comments.parent_id in (#{comment_ids.join(',')})")
  end

end
