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

RSpec.describe Post, type: :model do
  let(:user) { create :user }

  it "is valid with content and user_id" do
    post = user.posts.build(content: "wow")
    expect(post).to be_valid
  end

  it "is valid without user_id" do
    post = user.posts.build(content: "wow")
    post.user_id = nil
    expect(post).not_to be_valid
  end

  it "is valid without content" do
    post = user.posts.build(content: "")
    expect(post).not_to be_valid
  end
end
