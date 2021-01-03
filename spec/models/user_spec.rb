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

RSpec.describe User, type: :model do
  it "is valid with name, email, password" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "is invalid without name" do
    user = build(:user, name: "")
    expect(user).not_to be_valid
  end

  it "is invalid without email" do
    user = build(:user, email: "")
    expect(user).not_to be_valid
  end

  it "is invalid without password" do
    user = build(:user, password: "")
    expect(user).not_to be_valid
  end

  it "is invalid with too long name" do
    user = build(:user, name: "a" * 51)
    expect(user).not_to be_valid
  end

  it "is invalid with blank password" do
    user = build(:user, password: " " * 6, password_confirmation: " " * 6)
    expect(user).not_to be_valid
  end

  it "is invalid with too short password" do
    user = build(:user, password: "a" * 5, password_confirmation: "a" * 5)
    expect(user).not_to be_valid
  end

  it "is invalid with too long email" do
    user = build(:user, email: "a" * 240 + "@example.com")
    expect(user).not_to be_valid
  end

  it "accepts valid addresses" do
    valid_addresses = %w(
      user@example.com USER@foo.COM A_US-ER@foo.bar.org
      first.last@foo.jp alice+bob@baz.cn
    )
    valid_addresses.each do |valid_address|
      user = build(:user, email: valid_address)
      expect(user).to be_valid, "#{valid_address.inspect} should be valid"
    end
  end

  it "rejects invalid addresses" do
    invalid_addresses = %w(
      user@example,com user_at_foo.org user.name@example.
      foo@bar_baz.com foo@bar+baz.com
    )
    invalid_addresses.each do |invalid_address|
      user = build(:user, email: invalid_address)
      expect(user).not_to be_valid, "#{invalid_address.inspect} should be valid"
    end
  end

  it "rejects duplicated email" do
    user = create(:user)
    duplicate_user = user.dup
    expect(duplicate_user).not_to be_valid
  end

  it "destroys posts with user" do
    user = create(:user)
    user.posts.create!(content: "Wow")
    expect do
      user.destroy
    end.to change(Post, :count).by(-1)
  end
end
