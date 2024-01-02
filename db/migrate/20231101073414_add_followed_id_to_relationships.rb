class AddFollowedIdToRelationships < ActiveRecord::Migration[7.0]
  def change
    add_reference :relationships, :followed, foreign_key: { to_table: :users }
  end
end
