# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#  index_comments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#

RSpec.describe Comment, type: :model do
  let(:user) { create :user }
  let(:post) { create :post }

  it "is valid with content, post_id and user_id" do
    post = user.posts.create(content: "heyhey")
    comment = user.comments.build(post_id: post.id, content: "hey")
    expect(comment).to be_valid
  end

  it "is invalid without post_id" do
    comment = Comment.new(content: "hey")
    expect(comment).not_to be_valid
  end
end
