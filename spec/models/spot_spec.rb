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

RSpec.describe Spot, type: :model do
  let(:user) { create :user }

  it "is valid with post_id" do
    post = user.posts.build(content: "heyhey")
    spot = post.build_spot(address: "hey")
    expect(spot).to be_valid
  end

  it "is invalid without post_id" do
    spot = Spot.new(address: "hey")
    expect(spot).not_to be_valid
  end
end
