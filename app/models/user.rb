class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pins
  has_many :likes

  validates :name, presence: true, uniqueness: true

  # Roles = 'super', 'editor', 'normal'


  def to_param
    "#{id}-#{name.parameterize}"
  end

  scope :admins, -> {where(role: :admin)}
  scope :normal_users, -> {where(role: :normal)}


  def likes?(product)
    product.likes.where(user_id: id).any?
  end

  def is?(requested_role)
    self.role == requested_role.to_s
  end

	after_create :send_notification

  def send_notification
    Admin.new_user(self).deliver
    Admin.welcome(self).deliver
  end

end
