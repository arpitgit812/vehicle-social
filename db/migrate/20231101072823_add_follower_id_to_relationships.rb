class AddFollowerIdToRelationships < ActiveRecord::Migration[7.0]
  def change
    add_reference :relationships, :follower, foreign_key: { to_table: :users }, index: true
  end
end
