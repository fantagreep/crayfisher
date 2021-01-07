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

# RSpec.describe Spot, type: :model do
# pending "add some examples to (or delete) #{__FILE__}"
# end
