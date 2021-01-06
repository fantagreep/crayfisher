# == Schema Information
#
# Table name: spots
#
#  id         :bigint           not null, primary key
#  address    :string
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#
# Indexes
#
#  index_spots_on_post_id  (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#
FactoryBot.define do
  factory :spot do
    address { "MyString" }
    latitude { 1.5 }
    longitude { 1.5 }
  end
end
