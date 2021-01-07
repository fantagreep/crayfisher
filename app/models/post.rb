# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_posts_on_user_id                 (user_id)
#  index_posts_on_user_id_and_created_at  (user_id,created_at)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "mini_magick"

class Post < ApplicationRecord
  belongs_to :user
  has_one :spot, dependent: :destroy
  accepts_nested_attributes_for :spot
  has_one_attached :picture
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :picture, content_type: {
    in: %w(image/jpeg image/gif image/png),
    message: "有効なフォーマットではありません",
  },
                      size: {
                        less_than: 5.megabytes,
                        message: "容量が大きすぎます",
                      }

  def display_image
    picture.variant(gravity: :center, resize: "300x300^", crop: "500x500+0+0")
  end
end
