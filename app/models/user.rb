# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           not null
#  encrypted_password     :string           default(""), not null
#  name                   :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  has_one_attached :image
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: true, length: { maximum: 250 }, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  has_one_attached :image
  has_many :posts, dependent: :destroy
  before_create :default_image

  def update_with_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = update(params, *options)

    clean_up_passwords
    result
  end

  def feed
    Post.where("user_id = ?", id).includes([:user, { picture_attachment: :blob }, :spot])
  end

  def nav
    image&.variant(gravity: :center, resize: "20x20^", crop: "20x20+0+0")
  end

  def icon
    image&.variant(gravity: :center, resize: "50x50^", crop: "50x50+0+0")
  end

  def avator
    image&.variant(gravity: :center, resize: "100x100^", crop: "100x100+0+0")
  end

  def default_image
    if !image.attached?
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-profile-image.png')),
                   filename: 'default-profile-image.png', content_type: 'image/png')
    end
  end
end
