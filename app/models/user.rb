class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pins
  has_many :likes
  belongs_to :state

  validates :name, presence: true, uniqueness: true

  Roles = 'super', 'editor', 'normal'
  Facebook = "https://twitter.com/?lang=en"
  Twitter = "https://twitter.com/?lang=en"


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
    AdminMailer.new_user(self).deliver
    AdminMailer.welcome(self).deliver
  end

end
