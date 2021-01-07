class RemoveTitleFromPosts < ActiveRecord::Migration[5.2]
  def up
    remove_column :posts, :title, :string
  end

  def down
    add_column :posts, :title, :string
  end
end
