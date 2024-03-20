class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.integer :user_id, null: false
      t.integer :commentable_id, null: false
      t.string :commentable_type, null: false
      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, [:commentable_type, :commentable_id]
    add_foreign_key :comments, :users, column: :user_id
    add_foreign_key :comments, :commentables, column: :commentable_id
  end
end
