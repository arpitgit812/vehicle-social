class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships, id: false do |t|
      t.belongs_to :follower, index: true, foreign_key: { to_table: :users }
      t.belongs_to :followed, index: true, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end

