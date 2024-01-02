class AddShareCountToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :share_count, :integer
  end
end
